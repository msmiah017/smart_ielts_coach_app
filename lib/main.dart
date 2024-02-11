import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    bool darkModeEnabled = false;
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: darkModeEnabled ? darkTheme : lightTheme,
      darkTheme: darkTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testing color and font"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
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

