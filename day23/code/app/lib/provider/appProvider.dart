import 'dart:convert';

import 'package:day1/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class appProvider extends ChangeNotifier {
  // get data from json
  List<Articles>? _data_u;

  final _en_data_article = articlesFromJson(jsonEncode(data));
  final _hi_data_article = articlesFromJson(jsonEncode(hindi_data));

// get data
  List<Articles> getData() {
    final Locale systemLocales =
        WidgetsBinding.instance.platformDispatcher.locale;
    if (systemLocales.languageCode == 'hi') {
      _data_u = _hi_data_article;
      print(systemLocales.languageCode);
    } else {
      _data_u = _en_data_article;
    }
    return _data_u!;
  }

  changeBookmark(int id) {
 
    _en_data_article.map((e) => {
          if (e.id == id) {e.isBookmark = !e.isBookmark}
        });

    _hi_data_article.map((e) => {
          if (e.id == id) {e.isBookmark = !e.isBookmark}
        });
    getData();
    notifyListeners();
  }

}
