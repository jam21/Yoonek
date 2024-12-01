import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoonek/app/ui/widgets.dart';
import 'package:yoonek/app/widgets.dart';
import 'package:yoonek/data/datasource/user.dart';
import 'package:yoonek/data/network/apis.dart';
import 'package:yoonek/data/repository/user.dart';
import 'package:yoonek/domain/entities/session.dart';
import 'package:yoonek/domain/repositories/user.dart';
import 'package:yoonek/domain/usecases/user.dart';
import 'package:yoonek/main.dart';

class SessionProvider extends ResponseNotifier<Session> {
  final LoginUserUsecase loginUserUsecase;
  // Session? session;

  SessionProvider({required this.loginUserUsecase});

  Future<void> loginUser(
      {required String userName,
      required String password,
      required String grantType}) async {
    response = Loading();
    notifyListeners();
    try {
      Session data = await loginUserUsecase.call(
          userName: userName, password: password, grantType: grantType);
      response = Success(data: data);
    } on Exception catch (e) {
      response = Error(exception: e);
    }

    notifyListeners();

    // session = await loginUserUsecase.call(
    //     userName: userName, password: password, grantType: grantType);
    // notifyListeners();
  }

  @override
  Response<Session>? response;
}

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final SessionRepository sessionRepository =
        SessionRepositoryImpl(dataSource: SessionRemoteDataSource());
    final LoginUserUsecase loginUserUsecase =
        LoginUserUsecase(repository: sessionRepository);
    final SessionProvider sessionProvider =
        SessionProvider(loginUserUsecase: loginUserUsecase);

    return Scaffold(
        body: ResponseListenableBuilder(
            listenable: sessionProvider,
            onResponseSuccess: (context, data) {
              Navigator.pushReplacementNamed(context, Routes.dashboard);
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                      child: Center(
                    child: SvgPicture.asset(
                      'assets/svgs/logo.svg',
                      width: 100,
                      height: 100,
                    ),
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      TextField(
                        controller: _userNameController,
                        decoration: const InputDecoration(
                            hintText: "User name",
                            prefixIcon: Icon(Icons.person_outline)),
                      ),
                      PasswordField(
                        controller: _passwordController,
                        hintText: "Password",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            sessionProvider.loginUser(
                                userName: "arslan.khalid",
                                password: "Abc123",
                                grantType: "password");
                          },
                          child: const Padding(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child: Text("Sign In")))
                    ],
                  ))
                ],
              ),
            )));
  }
}
