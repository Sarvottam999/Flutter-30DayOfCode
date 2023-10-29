 // screens/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
// import '../store.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<String>, List<String>>(
      converter: (store) => store.state,
      builder: (context, cartItems) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Cart'),
          ),
          body: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(cartItems[index]),
              );
            },
          ),
        );
      },
    );
  }
}
