import 'package:flutter/material.dart';
import 'package:temp1/Music.dart';
import 'package:temp1/screen2.dart';

void main() {
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
       
          body: Screen2(),
        ),
      ),
    );
  }
}
 