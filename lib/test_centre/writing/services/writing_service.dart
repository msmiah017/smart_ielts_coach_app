import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WritingService {
  static const String baseWritingUrl =
      "http://192.168.1.138:5000/smart_ielts_coach/writing_questions";

  static Future<List> fetchWritingQuestions() async {
    final response = await http.get(Uri.parse(baseWritingUrl));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      return responseData;
    } else {
      return [];
    }
  }

}
