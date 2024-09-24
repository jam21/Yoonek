import 'package:yoonek/domain/entities/session.dart';
import 'package:yoonek/domain/repositories/user.dart';

class LoginUserUsecase{
  final SessionRepository repository;

  LoginUserUsecase({required this.repository});

  Future<Session> call({required String userName, required String password, required String grantType}) async{
    return await repository.loginUser(userName: userName, password: password, grantType: grantType);
  }
}