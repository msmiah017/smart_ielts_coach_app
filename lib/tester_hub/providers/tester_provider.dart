import 'package:flutter/cupertino.dart';

class TesterProvider extends ChangeNotifier{

  double _width = 0;
  double get width => _width;
  void setWidth(value){
    _width = value;
    notifyListeners();
  }

  void toggleWidth(){
    _width = _width == 100 ? _width : 100;
    notifyListeners();
  }





}