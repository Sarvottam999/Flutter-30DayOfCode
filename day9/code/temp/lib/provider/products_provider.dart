 import '../data/shoes.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
 
class Product_provider extends ChangeNotifier{
        List<Shoes> _products = shoesList ;
    // double totalPrice =0 ;

  // CartModel({
  //   // this.products = shoesList,
  //   // this.totalPrice = 0,
  // });

  void addProduct(Shoes product) {
    final newProducts = <Shoes>[..._products, product];
    // final newTotalPrice = totalPrice + product.price;

    _products.replaceRange(0, _products.length, newProducts);
    // totalPrice = newTotalPrice;

    notifyListeners();
  }

  // void removeProduct(Shoes product) {
  //   final newProducts = _products.where((p) => p != product).toList();
  //   final newTotalPrice = totalPrice - product.price;

  //   _products.replaceRange(0, _products.length, newProducts);
  //   totalPrice = newTotalPrice;

  //   notifyListeners();

  // }

   List get getListPtoducs =>  [..._products];

   Shoes getProductById(int id) {
    return _products.firstWhere((p) => p.id == id);
 }
}

 