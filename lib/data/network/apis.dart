import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yoonek/domain/entities/session.dart';

HttpClientWithMiddleware logableHttp = HttpClientWithMiddleware.build(
    middlewares: [HttpLogger(logLevel: LogLevel.BODY)]);

extension ExtendString on String{
  Uri toHttps([String path="",
      Map<String, dynamic>? queryParameters]) => Uri.https(this, path,queryParameters);
}
Future<String> get baseURL async{
  final prefs = await SharedPreferences.getInstance();  
  final String? baseUrl = prefs.getString('baseUrl');
  return baseUrl??'yoonek.thzeal.com';
}

String loginPath = '/token';
const String getEventsPath = '/api/HCMMobileApp/Events';
const String getLeaveBalancesPath = '/api/HCMMobileApp/Leaves/';
const String getAnnouncementsPath = '/api/HCMMobileApp/Announcements';
const String getReportersPath = '/api/HCMMobileApp/Reporters/';
const String getPoliciesPath = '/api/HCMMobileApp/Policies';
const String getSupervisorPath = '/api/EmployeeSetup/GetSuperviosrData/';
const String getPayPeriodPath = '/api/HCMMobileApp/PayPeriods';

Future<http.Response> loginUserRequest({required String userName, required String password, required String grantType}) async{
  Uri uri = Uri.parse("${await baseURL}$loginPath");

  return logableHttp.post(uri, body: {'username':userName, 'password':password, 'grant_type':grantType});
}



// Fetch Events
Future<http.Response> getEventsRequest({required int employeeID, required int org}) async {
  Uri uri = Uri.parse("${await baseURL}$getEventsPath").replace(queryParameters: {
    "EmployeeID": employeeID.toString(),
    "o": org.toString(),
  });
  // Uri uri = (await baseURL).toHttps(getEventsPath, {
  //   "EmployeeID": employeeID.toString(),
  //   "o": org.toString(),
  // });
  return logableHttp.get(uri, headers: {"Authorization":"${Session.current().tokenType} ${Session.current().accessToken}"});
}

// Fetch Leave Balances
Future<http.Response> getLeaveBalancesRequest(Map<String, String> params) async {
  Uri uri = Uri.parse("${await baseURL}$getLeaveBalancesPath");
  // Uri uri = (await baseURL).toHttps(getLeaveBalancesPath);
  return logableHttp.post(
    uri,
    headers: {"Content-Type": "application/json", "Authorization":"${Session.current().tokenType} ${Session.current().accessToken}"},
    body: jsonEncode(params),
  );
}

// Fetch Announcements
Future<http.Response> getAnnouncementsRequest({required int employeeID, required int org}) async {
  Uri uri = Uri.parse("${await baseURL}$getAnnouncementsPath").replace(queryParameters: {
    "EmployeeID": employeeID.toString(),
    "o": org.toString(),
    "appId":22.toString()
  });
  // Uri uri = (await baseURL).toHttps(getAnnouncementsPath, {
  //   "EmployeeID": employeeID.toString(),
  //   "o": org.toString(),
  //   "appId":22.toString()
  // });
  return logableHttp.get(uri, headers: {"Authorization":"${Session.current().tokenType} ${Session.current().accessToken}"});
}

// Fetch Reporters
Future<http.Response> getReportersRequest(Map<String, String> params) async {
  Uri uri = Uri.parse("${await baseURL}$getReportersPath");
  // Uri uri = (await baseURL).toHttps(getReportersPath);
  return logableHttp.post(
    uri,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(params),
  );
}

// Fetch Policies
Future<http.Response> getPoliciesRequest({required int employeeID, required int org}) async {
  Uri uri = Uri.parse("${await baseURL}$getPoliciesPath").replace(queryParameters: {
    "EmployeeID": employeeID.toString(),
    "o": org.toString(),
  });
  // Uri uri = (await baseURL).toHttps(getPoliciesPath, {
  //   "EmployeeID": employeeID.toString(),
  //   "o": org.toString(),
  // });
  //   return logableHttp.post(
  //   uri,
  //   headers: {"Content-Type": "application/json", "Authorization":"${Session.current().tokenType} ${Session.current().accessToken}"},
  //   body: jsonEncode(params),
  // );

  return logableHttp.get(uri, headers: {"Content-Type": "application/json", "Authorization":"${Session.current().tokenType} ${Session.current().accessToken}"},);
}

// Fetch Supervisor
Future<http.Response> getSupervisorRequest(Map<String, String> params) async {
  Uri uri = Uri.parse("${await baseURL}$getSupervisorPath");
  // Uri uri = (await baseURL).toHttps(getSupervisorPath);
  return logableHttp.post(
    uri,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(params),
  );
}

// Fetch Pay Periods
Future<http.Response> getPayPeriodRequest({required int orgId}) async {
  Uri uri = Uri.parse("${await baseURL}$getPayPeriodPath").replace(queryParameters: {
    "OrgId": orgId.toString(),
  });
  // Uri uri = (await baseURL).toHttps(getPayPeriodPath, {
  //   "OrgId": orgId.toString(),
  // });
  return logableHttp.get(uri);
}

class Response<T>{}

abstract class ResponseNotifier<T> with ChangeNotifier{
  abstract Response<T>? response;

  T? getData(){
    if(this is Success){
      return (this as Success).data;
    }
    return null;
  }
}
class Loading<T> extends Response<T>{}

class Success<T> extends Response<T>{
  final T data;

  Success({required this.data});
}

class Error<T> extends Response<T>{
  final Exception exception;

  Error({required this.exception});
}
