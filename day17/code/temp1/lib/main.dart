import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp1/Music.dart';
import 'package:temp1/providers/fav_provider.dart';
import 'package:temp1/providers/resent_provider.dart';
import 'package:temp1/providers/songs_provider.dart';
import 'package:temp1/screens/screen1.dart';
import 'package:temp1/screens/screen2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Song_provider()),
          ChangeNotifierProvider(create: (context) => recent_provider()),
          ChangeNotifierProvider(create: (context) => fav_provider()),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: screen1(),
          ),
        ),
      ),
    );
  }
}
