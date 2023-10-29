// reducers.dart
import 'package:day1/action-color.dart';
import 'package:redux/redux.dart';

List<String> cartReducer(List<String> state, dynamic action) {
  if (action is AddToCartAction) {
    return List.from(state)..add(action.color);
  }
  return state;
}

final appReducer = combineReducers<List<String>>([
  TypedReducer<List<String>, AddToCartAction>(cartReducer),
]);
