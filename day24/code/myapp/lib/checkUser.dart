import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/loginScreen.dart';
import 'package:myapp/main.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(future: checkuser()
     ,builder: (context, snapshot) {
      if (snapshot.hasData){
        return snapshot.data as Widget;
      }
      else{
        return CircularProgressIndicator();
      }
    });

   
  }

   checkuser() async{
      final user  = FirebaseAuth.instance.currentUser;
      if (user == null){
    return LoginScreen();
      }
      else{
        return MyHomePage(title: "home");
      }

    }
}