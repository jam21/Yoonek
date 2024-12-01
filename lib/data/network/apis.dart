import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


extension ExtendString on String{
  Uri toHttps([String path="",
      Map<String, dynamic>? queryParameters]) => Uri.https(this, path,queryParameters);
}
String baseURL = 'yoonek.thzeal.com';
String loginPath = '/ZealERPTest/token';
const String getEventsPath = '/ZealERPTest/api/AnnouncementAndMapping/GetDataForEventTile';
const String getLeaveBalancesPath = '/ZealERPTest/api/LeaveCount/GetLeaveBalanceForCard/';
const String getAnnouncementsPath = '/ZealERPTest/api/AnnouncementAndMapping/GetDataForAnnouncementTile';
const String getReportersPath = '/ZealERPTest/api/EmployeeSetup/GetReportesData/';
const String getPoliciesPath = '/ZealERPTest/api/PlanMapping/GetDataForPolicyTile';
const String getSupervisorPath = '/ZealERPTest/api/EmployeeSetup/GetSuperviosrData/';
const String getPayPeriodPath = '/ZealERPTest/api/SalarySlip/GetPayPeriodDates';

Future<http.Response> loginUserRequest({required String userName, required String password, required String grantType}){
  Uri uri = baseURL.toHttps(loginPath);

  return http.post(uri, body: {'username':userName, 'password':password, 'grant_type':grantType});
}



// Fetch Events
Future<http.Response> getEventsRequest({required int employeeID, required int org}) {
  Uri uri = baseURL.toHttps(getEventsPath, {
    "EmployeeID": employeeID.toString(),
    "o": org.toString(),
  });
  return http.get(uri);
}

// Fetch Leave Balances
Future<http.Response> getLeaveBalancesRequest(Map<String, String> params) {
  Uri uri = baseURL.toHttps(getLeaveBalancesPath);
  return http.post(
    uri,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(params),
  );
}

// Fetch Announcements
Future<http.Response> getAnnouncementsRequest({required int employeeID, required int org}) {
  Uri uri = baseURL.toHttps(getAnnouncementsPath, {
    "EmployeeID": employeeID.toString(),
    "o": org.toString(),
  });
  return http.get(uri);
}

// Fetch Reporters
Future<http.Response> getReportersRequest(Map<String, String> params) {
  Uri uri = baseURL.toHttps(getReportersPath);
  return http.post(
    uri,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(params),
  );
}

// Fetch Policies
Future<http.Response> getPoliciesRequest({required int employeeID, required int org}) {
  Uri uri = baseURL.toHttps(getPoliciesPath, {
    "EmployeeID": employeeID.toString(),
    "o": org.toString(),
  });
  return http.get(uri);
}

// Fetch Supervisor
Future<http.Response> getSupervisorRequest(Map<String, String> params) {
  Uri uri = baseURL.toHttps(getSupervisorPath);
  return http.post(
    uri,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(params),
  );
}

// Fetch Pay Periods
Future<http.Response> getPayPeriodRequest({required int orgId}) {
  Uri uri = baseURL.toHttps(getPayPeriodPath, {
    "OrgId": orgId.toString(),
  });
  return http.get(uri);
}

class Response<T>{}

abstract class ResponseNotifier<T> with ChangeNotifier{
  abstract Response<T>? response;
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
