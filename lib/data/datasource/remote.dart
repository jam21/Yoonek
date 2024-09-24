import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteDataSource {
  dynamic safeApiCall(final Future<http.Response> Function() api, ) async {
    try {
      http.Response response = await api();
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }else{
        throw Exception(response.body.toString());
      }
    } catch (e) {
      rethrow;
    }
  }
}
