import 'package:day1/home.dart';
import 'package:day1/provider/appProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:io';
import 'dart:ui';

import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => appProvider()),
    ], child: CounterApp()));

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
          onGenerateTitle: (context) {
            return AppLocalizations.of(context)!.appTitle1;
          },
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
           supportedLocales: [
            const Locale('en'),
            const Locale('hi'),
          ], 

          home: 
              HomePage() 
          ),
    );
  }
}

 