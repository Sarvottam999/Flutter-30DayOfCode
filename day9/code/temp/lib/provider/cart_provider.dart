 import '../data/shoes.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
 
class Cart_provider extends ChangeNotifier{
      
  List<Cart_Item> _products = [];
  // totoal number of items added in curent 
  int _total_no_of_items = 0 ;



  // method to get total number of items  added in current in cart
  int get_total_no_of_items(){

    return _total_no_of_items ;
  }//method to delete al number of items  added in current in cart
  void delete_total_no_of_items(){

    _total_no_of_items = 0 ;
    notifyListeners();
  }

  // Cart_provider(this.products);

  // Method to get all items
  List<Cart_Item> getAllItems() {
    return [..._products];
  }
 void addcartProduct(Cart_Item product) {
    // final newProducts = <Cart_Item>[..._products, product];
    // final newTotalPrice = totalPrice + product.price;
_products.add(product);
_total_no_of_items = _total_no_of_items + 1 ;
    // _products.replaceRange(0, _products.length, newProducts);
    // totalPrice = newTotalPrice;

    notifyListeners();
  }

  // Method to delete single item
  void deleteItem(int index) {
    print(_products.length);
    _products.removeAt(index);
    print(_products.length);

    notifyListeners();

  }

  // Method to get total price of all products
  double getTotalPrice() {
    double total = 0.0;
    for (var product in _products) {
      total += product.item.price;
    }
    return total;
  }
}

 

 class Cart_Item {
  // final int id;
  // final String name;
  // final double price;
  final no_of_items  ;
  final String size;
  final Shoes item;

  // final Color color;
  // final List background_color;

  // String url ;

  Cart_Item(  this.no_of_items, this.size, this.item);
}