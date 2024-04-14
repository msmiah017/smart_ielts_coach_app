import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int _currentNavItemIndex = 0;
  int get currentNavItemIndex => _currentNavItemIndex;
  void setCurrentNavItemIndex(int value) {
    _currentNavItemIndex = value;
    notifyListeners();
  }

  bool _darkModeEnabled = false;
  bool get darkModeEnabled => _darkModeEnabled;
  void setDarkModeEnabled(bool value) {
    _darkModeEnabled = value;
    notifyListeners();
  }

  // bool

//   Home Screen Test Centre Providers
  final List<bool> _activeBtn = [true, false, false, false];
  List<bool> get activeBtn => _activeBtn;

  void activateBtn(String btnTxt) {
    if (btnTxt == "Reading") {
      _activeBtn[0] = true;
      _activeBtn[1] = false;
      _activeBtn[2] = false;
      _activeBtn[3] = false;

    } else if (btnTxt == "Listening") {
      _activeBtn[0] = false;
      _activeBtn[1] = true;
      _activeBtn[2] = false;
      _activeBtn[3] = false;
    } else if (btnTxt == "Writing") {
      _activeBtn[0] = false;
      _activeBtn[1] = false;
      _activeBtn[2] = true;
      _activeBtn[3] = false;
    } else {
      _activeBtn[0] = false;
      _activeBtn[1] = false;
      _activeBtn[2] = false;
      _activeBtn[3] = true;
    }
    notifyListeners();
  }
}
