import 'package:flutter/material.dart';
import 'package:yoonek/app/ui/dashboard/dashboard.dart';
import 'package:yoonek/data/datasource/user.dart';
import 'package:yoonek/data/repository/user.dart';
import 'package:yoonek/domain/repositories/user.dart';
import 'package:yoonek/domain/usecases/user.dart';
import 'app/ui/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Yoonek',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.login,
      routes: Routes.getRoutes(),
    );
  }
}

class Routes {
  static const String login = '/login';
  static const String dashboard = '/dashboard';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => LoginScreen(),
      dashboard: (context) => DashboardScreen(),
    };
  }
}
