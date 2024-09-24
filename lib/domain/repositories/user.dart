import 'package:yoonek/domain/entities/session.dart';

abstract class SessionRepository{
  Future<Session> loginUser({required String userName,required String password,required String grantType});
}