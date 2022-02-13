import 'dart:async';
import 'dart:convert';

import 'package:class_link/app/global/const/credentials.dart';
import 'package:class_link/app/models/firebase_user/firebase_user.dart';
import 'package:class_link/app/services/auth_service.dart';
import 'package:class_link/app/services/hive_database.dart';
import 'package:class_link/app/utils/get_snackbar.dart';
import 'package:googleapis/oauth2/v2.dart' as oauth;
import 'package:get/get.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../utils/extension.dart';

enum AuthStatus { authenticated, unauthenticated, uninit }

class AuthRestService extends GetxService {
  String? firebaseToken;

  final _status = AuthStatus.uninit.obs;
  AuthStatus get status => _status.value;
  final Rx<FirebaseUser?> _user = Rx<FirebaseUser?>(null);
  FirebaseUser? get user => _user.value;
  static const _authCredsKeyName = 'current_user';
  Timer? _timer;
  Box<String?>? _userBox;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  UserType userType() {
    final email = _user.value?.email;
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

  Future<void> init() async {
    _userBox = await Hive.openBox("authbox");
    final userJson = _userBox?.get(_authCredsKeyName);
     if (userJson == null) {
      _status.value = AuthStatus.unauthenticated;
    }
    else {
      final user = FirebaseUser.fromJson(jsonDecode(userJson));
      if (user. ?? true) {
        final res = await http.post(
            Uri.parse(
                "https://securetoken.googleapis.com/v1/token?key=${AppCredentials.apiKey}"),
            body: {
              "grant_type": "refresh_token",
              "refresh_token": user.refreshToken
            });
        if (res.statusCode == 200) {
          final resParsed = jsonDecode(res.body);
          AccessCredentials.fromJson({
            "accessToken": {"type": "Bearer", "data": ""}
          });
        } else {
          _status.value = AuthStatus.unauthenticated;
        }
      }
      _status.value = AuthStatus.authenticated;
    }
  }

  Future<UserType> login() async {
    http.Client client = http.Client();
    try {
      final authClient = await obtainAccessCredentialsViaUserConsent(
          ClientId(
              AppCredentials.oauthClientId, AppCredentials.oauthClientSecret),
          ['https://www.googleapis.com/auth/userinfo.profile'],
          client, (url) async {
        if (await canLaunch(url)) {
          launch(url);
        } else {
          Message("Cannot open url!",
              "Please visit the following URL in your browser manually and sign in to your google account: $url");
        }
      }, hostedDomain: 'kiit.ac.in');
      final res = await client.post(
        Uri.parse(
            "https://identitytoolkit.googleapis.com/v1/accounts:signInWithIdp?key=${AppCredentials.apiKey}"),
        body: {
          "requestUri": "http://locahost",
          "postBody": "id_token=${authClient.idToken}&providerId=google.com",
          "returnSecureToken": "true"
        },
      );
      if (res.statusCode == 200) {
        print(jsonDecode(res.body));
        _user.value = FirebaseUser.fromJson(jsonDecode(res.body));
        _userBox?.put(_authCredsKeyName, jsonEncode(_user.value?.toJson()));
        _status.value = AuthStatus.authenticated;
      } else {
        throw Exception(res.body);
      }
    } catch (e, f) {
      Message("Something went wrong!", e.toString());
      _status.value = AuthStatus.unauthenticated;
      print(e);
      print(f);
    } finally {
      client.close();
    }
    return userType();
  }
}
