import 'package:flutter/material.dart';
import 'package:day1/screen1.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';
import 'package:day1/sql_service.dart';

void main()async  {
  // WidgetsFlutterBinding.ensureInitialized();


  runApp(MultiProvider(
     providers: [
        ChangeNotifierProvider(create: (context) => Sql_services()),
    ],
child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
       
        body: 
        AutheticationScreen(),
      ),
    );
  }
}
 