
import 'package:yoonek/data/datasource/remote.dart';
import 'package:yoonek/data/models/user.dart';
import 'package:yoonek/data/network/apis.dart';
import 'package:yoonek/domain/entities/session.dart';

abstract interface class SessionDataSource {
  Future<Session> loginUser(
      {required String userName,
      required String password,
      required String grantType});
}

class SessionRemoteDataSource extends RemoteDataSource
    implements SessionDataSource {
  @override
  Future<Session> loginUser(
      {required String userName,
      required String password,
      required String grantType}) async {
    dynamic response = await safeApiCall(() => loginUserRequest(
        userName: userName, password: password, grantType: grantType));
    return SessionModel.fromJson(response);
  }
}
