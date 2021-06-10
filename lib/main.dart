import 'package:carrotslabapp/src/constants/theme_data.dart';
import 'package:carrotslabapp/src/screens/HomeScreen/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeDataApp(),
      home: Homescreen(),
    );
  }
}
