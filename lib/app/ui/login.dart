import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:yoonek/app/widgets.dart';
import 'package:yoonek/domain/entities/session.dart';
import 'package:yoonek/domain/usecases/user.dart';

class SessionProvider with ChangeNotifier {
  final LoginUserUsecase loginUserUsecase;
  Session? session;

  SessionProvider({required this.loginUserUsecase});

  Future<void> loginUser(
      {required String userName,
      required String password,
      required String grantType}) async {
    session = await loginUserUsecase.call(
        userName: userName, password: password, grantType: grantType);
    notifyListeners();
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final SessionProvider sessionProvider =
        Provider.of<SessionProvider>(context);

    return Scaffold(
        body: FutureBuilder(
            future: sessionProvider.loginUserUsecase(
                userName: "arslan.khalid",
                password: "Abc123",
                grantType: "password"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container(
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
                            },
                            child: const Padding(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                child: Text("Sign In")))
                      ],
                    ))
                  ],
                ),
              );
            }));
  }
}
