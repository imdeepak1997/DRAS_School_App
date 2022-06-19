// import 'package:dras_school/class_list.dart';
// import 'package:dras_school/dashboard.dart';
// import 'package:dras_school/login_screen.dart';
// import 'package:dras_school/class_list.dart';
// import 'package:dras_school/dashboard.dart';
// import 'package:dras_school/topic_list.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SACE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blue,
        // cursorColor: Colors.orangeAccent,
        textTheme: TextTheme(
          headline3: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            color: Colors.white,
          ),
          button: TextStyle(
            fontFamily: 'OpenSans',
          ),
          subtitle1: TextStyle(fontFamily: 'NotoSans'),
          bodyText2: TextStyle(fontFamily: 'NotoSans'),
        ),
      ),
      home: LoginScreen(),
    );
  }
}