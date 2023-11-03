 
import 'package:day1/weatherscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
 

void main() {
 runApp(MyApp());
    
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:FrostedDemo()
       
      ),
    );
    }
}

 



 