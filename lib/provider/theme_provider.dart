import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() : _flag = false;
  bool _flag;

  bool get flag => _flag;

  ThemeData myTheme() => _flag ? ThemeData.dark() : ThemeData.light();

  void increment(){
    _flag = !_flag;
    myTheme();
    notifyListeners();
  }
}