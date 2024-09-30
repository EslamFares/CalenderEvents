import 'dart:convert';

import 'package:flutter_application_1/features/classlink/user_token.dart';
import 'package:flutter_application_1/utils/extentions/logger.dart';
import 'package:oauth2/oauth2.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OauthHttpClient extends http.BaseClient {
  final httpClient = http.Client();
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Accept'] = 'application/x-www-form-urlencoded';
    return httpClient.send(request);

    // request.headers['Accept'] = "*/*";
    // request.headers['Content-Type'] = "application/json";
    // request.headers['Accept-Encoding'] = 'gzip, deflate, br';
    // request.headers['Connection'] = 'keep-alive';
    // request.headers['User-Agent'] =
    //     'Mozilla/5.0 (Linux; Android 10; SM-A205U) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Mobile Safari/537.36';
    // request.headers['Sec-Fetch-Site'] = 'same-origin';
    // Logger("yhgtyutgy${request.url.host}");
    // request.headers['Host'] = request.url.host;
    // final modifiedRequest = http.Request("GET", request.url);
    // modifiedRequest.headers.addAll(request.headers);

    // return httpClient.send(modifiedRequest);
  }
}

class Repo {
  // test
  static const clientSecret = 'c8df4acad627a89730e06e361e77f5a9';
  static const clientId = 'c1692025819814b712a51017e82c5e9f26d21574bcc6';

  //production
// c172474712998482c022b2146798d85c71796b414f8116

  static final authorizationEndPoint =
      Uri.parse('https://launchpad.classlink.com/oauth2/v2/auth');

  //https://launchpad.classlink.com/oauth2/v2/auth
  //https://launchpad.classlink.com/cltest
  //https://launchpad.classlink.com/login

  static final tokenEndPoint =
      Uri.parse('https://launchpad.classlink.com/oauth2/v2/token');

  //https://launchpad.classlink.com/oauth2/v2/token
  //https://applications.apis.classlink.com/exchangeCode

  static final redirectUrl = Uri.parse('https://takalam-10721.nodechef.com/');

  //https://takalam-10721.nodechef.com/api/

  static const scopes = ["full"];

  AuthorizationCodeGrant createGrant() {
    return AuthorizationCodeGrant(
        clientId, authorizationEndPoint, tokenEndPoint,
        secret: clientSecret, httpClient: OauthHttpClient());
  }

  Uri getAuthorizatioURl(AuthorizationCodeGrant grant) {
    return grant.getAuthorizationUrl(redirectUrl, scopes: scopes);
  }

  Future<void> handelAuthorizationResponse(
      AuthorizationCodeGrant grant, Map<String, String> queryParams) async {
    Logger("query Params $queryParams");

    final tt = await grant.handleAuthorizationResponse(queryParams);
    Logger("user access token ${tt.credentials.accessToken}");

    // UserToken userToken = await getToken(tokenEndPoint.toString(), queryParams);
    // Logger("User access token ${userToken.token}");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", tt.credentials.accessToken);
  }
}

Future<UserToken> getToken(String url, Map<String, dynamic> queryParams) async {
  final res = await getRequest(url, queryParams: queryParams);
  return UserToken.fromJson(res.body);
}

getProfileInfo(String url, String? token) async {
  final res = await getRequest(url, token: token);
  return res.body;
}

Future getRequest(String url,
    {Map<String, dynamic>? queryParams, String? token}) async {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
  final response = await http.get(
      Uri.parse(url).replace(queryParameters: queryParams),
      headers: headers);
  Logger("res ${jsonDecode(response.body)}");

  return response;
}
