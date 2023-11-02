import 'package:flutter/material.dart';

class temp_screen extends StatefulWidget {
  const temp_screen({super.key});

  @override
  State<temp_screen> createState() => _temp_screenState();
}

class _temp_screenState extends State<temp_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('temp_screen')),
      body:  const Center(
      child: Text('temp_screen', style: TextStyle(fontSize:50, fontWeight:  FontWeight.w200),),
    ),
    );
  }
}