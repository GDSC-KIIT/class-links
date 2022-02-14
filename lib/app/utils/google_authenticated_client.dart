import 'package:http/http.dart' as http;

class GoogleAuthenticateClient extends http.BaseClient {
  static Map<String, String> getAuthHeadersFromAccessToken(String? accessToken){
    final String? token = accessToken;
    return <String, String>{
      "Authorization": "Bearer $token",
      "X-Goog-AuthUser": "0",
    };
  }
  final Map<String, String> headers;

  final http.Client client;

  GoogleAuthenticateClient(this.headers, this.client);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return client.send(request..headers.addAll(headers));
  }
}