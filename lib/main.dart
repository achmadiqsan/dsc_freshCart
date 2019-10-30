import 'package:flutter/material.dart';
import 'package:fresh_app/ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fresh App",
      home: Home(),
    );
  }
}


