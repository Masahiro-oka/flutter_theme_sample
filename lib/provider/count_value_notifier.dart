import 'package:flutter/cupertino.dart';

class CountNotifier extends ValueNotifier<int> {
  CountNotifier() : super(0);

  int count = 0;

  void increment(bool flag){
    if(flag){
      print('on tap plus');
      count++;
      notifyListeners();
    } else {
      print('on tap reset');
      count = 0;
      notifyListeners();
    }
  }

}