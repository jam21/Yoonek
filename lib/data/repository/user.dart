import 'package:yoonek/data/datasource/user.dart';
import 'package:yoonek/domain/entities/session.dart';
import 'package:yoonek/domain/repositories/user.dart';

class SessionRepositoryImpl extends SessionRepository{
  final SessionDataSource dataSource;

  SessionRepositoryImpl({required this.dataSource});

  @override
  Future<Session> loginUser({required String userName,required String password,required String grantType}) {
    return dataSource.loginUser(userName: userName, password: password, grantType: grantType);
  }
}