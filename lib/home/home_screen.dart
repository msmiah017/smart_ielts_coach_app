import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_ielts_coach_app/auth/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () async{
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('isLoggedIn', false);
            if (mounted) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const LoginScreen()));
            }
          }, icon: const Icon(Icons.logout))
        ],

      )
    );
  }
}
