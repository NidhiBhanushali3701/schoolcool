import 'package:flutter/material.dart';
import 'package:schoolcool/Splash.dart';
import 'package:schoolcool/screens/welcome/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SS Academy',
      theme: ThemeData(),
      //home: const Splash(),
      home: Welcome(),
    );
  }
}

