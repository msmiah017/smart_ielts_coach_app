import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {

  int _currentNavItemIndex = 0;
  int get currentNavItemIndex => _currentNavItemIndex;
  void setCurrentNavItemIndex(int value){
    _currentNavItemIndex = value;
    notifyListeners();
  }

  bool _darkModeEnabled = false;
  bool get darkModeEnabled => _darkModeEnabled;
  void setDarkModeEnabled(bool value){
    _darkModeEnabled = value;
    notifyListeners();
  }

  // bool


}
