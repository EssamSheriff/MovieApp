import 'package:flutter/material.dart';
import 'first_screen.dart';

void main() {
  runApp(MyApp(false));
}

class MyApp extends StatelessWidget {
  bool Theme;
  MyApp(this.Theme); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme ? ThemeData.light() : ThemeData.dark() ,
      home: Firstscreen(),
    );
  }
}
