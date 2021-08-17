import 'package:flutter/material.dart';
import './homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


// 11 creating UI for bloc
// 7:42