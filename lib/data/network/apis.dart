import 'package:http/http.dart' as http;


extension ExtendString on String{
  Uri toHttps([String path="",
      Map<String, dynamic>? queryParameters]) => Uri.https(this, path,queryParameters);
}
String baseURL = 'yoonek.thzeal.com';
String loginPath = '/ZealERPTest/token';

Future<http.Response> loginUserRequest({required String userName, required String password, required String grantType}){
  Uri uri = baseURL.toHttps(loginPath);

  return http.post(uri, body: {'username':userName, 'password':password, 'grant_type':grantType});
}