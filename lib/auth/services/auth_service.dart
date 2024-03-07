import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_ielts_coach_app/auth/models/user.dart';

class AuthService {
  static const String baseAuthUrl =
      "http://192.168.1.138:5000/smart_ielts_coach/user";

  Future<String> register(User newUser) async {
    try {
      final newUserData = {
        'accountType': newUser.accountType.toString().split('.').last,
        'accountName': newUser.accountName,
        'email': newUser.email,
        'password': newUser.password
      };
      final response = await http
          .post(
            Uri.parse('$baseAuthUrl/register'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(newUserData),
          )
          .timeout(const Duration(seconds: 10));
      // print("------------++++++++++++++++---------------$response");
      if (response.statusCode == 201) {
        // Successful registration
        return "success";
      } else if (response.statusCode == 422) {
        return "existing_user";
      } else {
        // Registration failed
        return "failed";
      }
    } on TimeoutException {
      return "timeout";
    } catch (e) {
      return "unknown_error";
    }
  }

  Future<String> login(RegisteredUser user) async {
    try {
      final existingUserData = {"email": user.email, "password": user.password};
      print(
          "====================================${jsonEncode(existingUserData)}");
      final response = await http
          .post(
            Uri.parse('$baseAuthUrl/login'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(existingUserData),
          )
          .timeout(
            const Duration(seconds: 10),
          );
      if (response.statusCode == 200) {
        // Successful login
        return "success";
      } else if (response.statusCode == 404) {
        return "invalid";
      } else {
        // Login failed
        return "failed";
      }
    } on TimeoutException {
      return "timeout";
    } catch (e) {
      // print(e);
      return "unknownError";
    }
  }
}
