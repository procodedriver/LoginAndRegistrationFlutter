import 'package:flutter/material.dart';
import 'package:normal/LoginAndRegistration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login And Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginAndRegistration(),
    );
  }
}