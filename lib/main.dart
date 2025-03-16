import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yoonek/app/ui/dashboard/dashboard.dart';
import 'package:yoonek/app/ui/dashboard/dashboard_controllers.dart';
import 'package:yoonek/app/ui/widgets.dart';
import 'package:yoonek/data/datasource/dashboard.dart';
import 'package:yoonek/data/network/apis.dart';
import 'package:yoonek/domain/entities/event.dart';
import 'package:yoonek/domain/entities/leave_balance.dart';
import 'package:yoonek/domain/entities/policy.dart';
import 'package:yoonek/domain/entities/session.dart';
import 'package:yoonek/domain/repositories/dashboard.dart';
import 'package:yoonek/domain/usecases/dashboard.dart';
import 'app/ui/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Environment {
  zealUAT,
  pillarUAT,
  pillarLive,
}

Map<Environment, String> baseUrls = {
  Environment.zealUAT: "https://yoonek.thzeal.com/ZealERPTest",
  Environment.pillarUAT: "https://uat-tms.5thpillartakaful.com",
  Environment.pillarLive: "https://tms.5thpillartakaful.com",
};

class EnvironmentSelectionScreen extends StatefulWidget {
  const EnvironmentSelectionScreen({super.key});

  @override
  State<EnvironmentSelectionScreen> createState() =>
      _EnvironmentSelectionScreenState();
}

class _EnvironmentSelectionScreenState extends State<EnvironmentSelectionScreen> {
  Environment? _selectedEnvironment;

  Future<void> _saveEnvironment(Environment env) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('baseUrl', baseUrls[env]!);

    if (!mounted) return; // Ensure widget is still in the tree before using context
    Navigator.pushReplacementNamed(context, Routes.login); // Navigate safely
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Environment")),
      body: Column(
        children: [
          ListTile(
            title: Text("Zeal UAT"),
            leading: Radio(
              value: Environment.zealUAT,
              groupValue: _selectedEnvironment,
              onChanged: (value) {
                setState(() => _selectedEnvironment = value as Environment);
              },
            ),
          ),
          ListTile(
            title: Text("5th Pillar UAT"),
            leading: Radio(
              value: Environment.pillarUAT,
              groupValue: _selectedEnvironment,
              onChanged: (value) {
                setState(() => _selectedEnvironment = value as Environment);
              },
            ),
          ),
          ListTile(
            title: Text("5th Pillar Live"),
            leading: Radio(
              value: Environment.pillarLive,
              groupValue: _selectedEnvironment,
              onChanged: (value) {
                setState(() => _selectedEnvironment = value as Environment);
              },
            ),
          ),
          ElevatedButton(
            onPressed: _selectedEnvironment == null ? null : () => _saveEnvironment(_selectedEnvironment!),
            child: Text("Save & Continue"),
          ),
        ],
      ),
    );
  }
}


class Routes {
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String urlSelection = '/urlSelection';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => LoginScreen(),
      dashboard: (context) => DashboardScreen(),
      urlSelection: (context) => EnvironmentSelectionScreen(),
    };
  }
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();  
  final String? baseUrl = prefs.getString('baseUrl');

  // debugRepaintRainbowEnabled = true;

  runApp(MyApp(initialRoute: baseUrl==null ? Routes.urlSelection : Routes.login,));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yoonek',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFF59CEA1)),
        useMaterial3: true,
      ),
      initialRoute: initialRoute,
      routes: Routes.getRoutes(),
    );
  }
}