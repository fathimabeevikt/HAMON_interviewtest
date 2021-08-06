import 'package:flutter/material.dart';
import 'package:interview_test/view/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF0a3d62),
          accentColor: Colors.green,
          shadowColor: Color(0xFFCFD8DC),
          fontFamily: "Raleway",
          textTheme: const TextTheme(
              headline1: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                height: 1.5,
              ),
              headline2: TextStyle(
                fontSize: 15.0,
                height: 1.5,
              ),
              headline3: TextStyle(
                fontSize: 25
              ))),
      home: HomeScreen(),
    );
  }
}
