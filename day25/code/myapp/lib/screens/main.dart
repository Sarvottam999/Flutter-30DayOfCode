import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/addContact.dart';
import 'package:myapp/screens/screen1.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 
  await Firebase.initializeApp( );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
         useMaterial3: true,
      ),
      home: 
      // AddContact()
      Screen1(),
    );
  }
}
 