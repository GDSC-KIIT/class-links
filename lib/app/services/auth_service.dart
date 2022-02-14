import 'dart:convert';

import 'package:class_link/app/global/const/credentials.dart';
import 'package:class_link/app/utils/google_authenticated_client.dart';
import 'package:class_link/app/utils/methods.dart';
import 'package:flutter/foundation.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../utils/extension.dart';

import '../utils/get_snackbar.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../utils/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:googleapis/people/v1.dart' show PeopleServiceApi;

enum UserType { user, kiitian, guest, none }
enum AuthStatus { uninitialised, unauthenticated, authenticated }

class AuthService extends GetxService {
  final Rx<ParseUser?> _user = Rx<ParseUser?>(null);
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _authStatus = AuthStatus.uninitialised.obs;
  AuthStatus get authStatus => _authStatus.value;
  ParseUser? get user => _user.value;

  bool get isAuthenticated => _user.value != null;

  @override
  void onInit() {
    super.onInit();
    ParseUser.currentUser().then((value) => _user.value = user);
  }

  Future<UserType> login() async {
    http.Client client = http.Client();
    try {
      late String? accessToken, id, idToken, name, email, photoURL;
      late bool emailVerified;
      if (AppMethods.isDesktop()) {
        final creds = await obtainAccessCredentialsViaUserConsent(
            ClientId(
                AppCredentials.oauthClientId, AppCredentials.oauthClientSecret),
            ['https://www.googleapis.com/auth/userinfo.profile', 'email'],
            client, (url) async {
          if (await canLaunch(url)) {
            launch(url);
          } else {
            Message("Cannot open url!",
                "Please visit the following URL in your browser manually and sign in to your google account: $url");
          }
        }, hostedDomain: 'kiit.ac.in');
        accessToken = creds.accessToken.data;
        idToken = creds.idToken;
        // final person = await PeopleServiceApi(GoogleAuthenticateClient(
        //         GoogleAuthenticateClient.getAuthHeadersFromAccessToken(
        //             accessToken),
        //         client))
        //     .people
        //     .get("people/me",
        //         personFields: "clientData,emailAddresses,externalIds");
        final data = AppMethods.parseJwt(idToken);
        id = data['sub'];
        photoURL = data['picture'];
        name = data['name'];
        email = data['email'];
        emailVerified = data['email_verified'];
      } else {
        // google_sign_in supported platforms
        final account = await _googleSignIn.signIn();
        if (account == null) {
          throw UserSignInFlowCancelled();
        }
        final creds = await account.authentication;
        accessToken = creds.accessToken;
        idToken = creds.idToken;
        id = account.id;
        name = account.displayName;
        email = account.email;
        photoURL = account.photoUrl;
        emailVerified = true; // TODO: Find a way to get if email is verified
      }
      if (accessToken == null || id == null || idToken == null) {
        Message("Error while signing in",
            "Unable to authenticated securely! Please try again");
        return UserType.none;
      }
      await ParseUser.loginWith('google', google(accessToken, id, idToken),
          email: email);

      _user.value = await ParseUser.currentUser();
      _user.value?.emailAddress = email;
      _user.value?.emailVerified = emailVerified;
      _user.value?.set("photoURL", photoURL);
      _user.value?.set("name", name);
      await _user.value?.save();
      return userType(_user.value?.emailAddress);
    } catch (e, f) {
      print(e.toString());
      print(f.toString());
      Message("Error while signing in", e.toString());
      return UserType.none;
    }
  }

  UserType userType([String? email]) {
    email = user?.emailAddress;
    if (email == null) {
      return UserType.none;
    } else if (email.endsWith("@kiit.ac.in")) {
      final rollNo = int.tryParse(email.split("@")[0]) ?? -1;
      if (rollNo.isBetween(2005000, 2005999) ||
          rollNo.isBetween(20051000, 20052010) ||
          rollNo.isBetween(2105000, 2105999) ||
          rollNo.isBetween(21051000, 21053467)) {
        return UserType.user;
      }
      return UserType.kiitian;
    } else {
      return UserType.guest;
    }
  }

  Future<void> logout() async {
    await _googleSignIn.signOut();
    await user?.logout();
    _user.value = null;
  }
}
