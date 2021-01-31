import 'package:flutter/material.dart';
import 'package:flutterthemesample/my_home_page.dart';
import 'package:flutterthemesample/provider/count_provider.dart';
import 'package:flutterthemesample/provider/count_value_notifier.dart';
import 'package:flutterthemesample/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          Provider<CountProvider>(
              create: (context) => CountProvider(),
            dispose: (context, value) => value.dispose(),
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
          ),
        ],
        child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myTheme = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme.myTheme(),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(title: 'Flutter Theme Sample'),
    );
  }
}

