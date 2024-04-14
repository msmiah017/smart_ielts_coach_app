import 'package:flutter/cupertino.dart';
import 'package:smart_ielts_coach_app/test_centre/writing/services/writing_service.dart';

class WritingProvider extends ChangeNotifier{
  bool _isRefreshing = false;
  bool get isRefreshing => _isRefreshing;
  void setIsRefreshing(value){
    _isRefreshing = value;
    notifyListeners();
  }

  List<Map<String, dynamic>> _writingQuestions = [];
  List<Map<String, dynamic>> get writingQuestions => _writingQuestions;

  Future<void> getWritingQuestions() async {
    final responseData = await WritingService.fetchWritingQuestions();
    _writingQuestions = List<Map<String, dynamic>>.from(responseData);
    notifyListeners();
  }



}