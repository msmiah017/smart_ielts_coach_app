import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_ielts_coach_app/auth/providers/auth_provider.dart';
import 'package:smart_ielts_coach_app/auth/screens/login_screen.dart';
import 'package:smart_ielts_coach_app/home/providers/home_provider.dart';
import 'package:smart_ielts_coach_app/test_centre/writing/providers/writing_provider.dart';
import 'package:smart_ielts_coach_app/tester_hub/providers/tester_provider.dart';
import 'package:smart_ielts_coach_app/tester_hub/screens/tester_screen.dart';
import 'home/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check if the user is already logged in
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => WritingProvider()),
        ChangeNotifierProvider(create: (_) => TesterProvider()),
      ],
      child: MyApp(
        isLoggedIn: isLoggedIn,
      )));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool darkModeEnabled = false;
    return Consumer<AuthProvider>(
        builder: (context, authProvider, _) => MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: darkModeEnabled ? darkTheme : lightTheme,
              darkTheme: darkTheme,
              //After finishing home page, replace
              // home: here with the code below
              // home: isLoggedIn
              //     ? const HomeScreen()
              //     : const LoginScreen(),
              home: const HomeScreen(),
          // home: const TesterScreen(),
            ));
    // home: isLoggedIn
    //     ? const HomeScreen()
    //     : const LoginScreen(),
  }
}

// Light Theme
final ThemeData lightTheme = ThemeData(
  fontFamily: 'Kameron',
  // brightness: Brightness.light,
  // primaryColor: Colors.white,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    background: Colors.white,
    onBackground: Colors.black,
    primary: Color(0xffC70039),
    onPrimary: Colors.white,
    secondary: Color(0xff008080),
    onSecondary: Colors.white,
    tertiary: Color(0xff757575),
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white54,
    onSurface: Colors.black,
  ),
);

// Dark Theme
final ThemeData darkTheme = ThemeData(
  fontFamily: 'Kameron',
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    background: Colors.black,
    onBackground: Colors.white,
    primary: Color(0xffC70039),
    onPrimary: Colors.white,
    secondary: Color(0xff008080),
    onSecondary: Colors.white,
    tertiary: Color(0xff757575),
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white54,
    onSurface: Colors.black,
    shadow: Color(0xff757575),
  ),
);
