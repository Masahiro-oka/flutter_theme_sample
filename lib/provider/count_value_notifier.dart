import 'package:flutter/cupertino.dart';

class CountNotifier extends ValueNotifier<int> {
  CountNotifier() : super(0);

  int count = 0;

  void increment(){
    print('on tap plus');
    count++;
    notifyListeners();
  }

  void reset(){
    print('on tap reset');
    count = 0;
    notifyListeners();
  }

}