import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp/provider/cart_provider.dart';
import 'package:temp/provider/like_provider.dart';
import 'package:temp/provider/products_provider.dart';
import 'package:temp/screens/screen4_favorite/S4_main.dart';
 import 'screens/screen1/A1_home.dart';

void main() {
 runApp(
  MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Cart_provider(),
        ),

        ChangeNotifierProvider(
          create: (context) => Product_provider(),
        ),

         ChangeNotifierProvider(
          create: (context) => Liked_provider(),
        ),
      ],
          child:   MyApp(),

    ));
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
        home:
          A1_home(),
 
      ),
    );
    }
}