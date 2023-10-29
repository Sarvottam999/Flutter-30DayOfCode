// store.dart
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './reducer-color.dart';

final store = Store<List<String>>(
  appReducer,
  initialState: [],
);
