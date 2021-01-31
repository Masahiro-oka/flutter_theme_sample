import 'package:flutter/material.dart';
import 'package:flutterthemesample/home_body.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({@required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return HomeBody(title: title);
  }
}
