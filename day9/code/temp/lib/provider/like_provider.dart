import 'package:flutter/material.dart';
import 'package:temp/data/shoes.dart';

// class Product {
//   final int id;
//   // final String name;
//   // final double price;

//   Product(this.id,
//   //  this.name, this.price
//    );
// }



class  Liked_provider extends ChangeNotifier {

List<Shoes> liked_products = [
  
];

  List<Shoes> getAllProducts() {
    return liked_products;
  }

  void deleteProductById(int id) {
    liked_products.removeWhere((product) => product.id == id);
    notifyListeners();
  }

  void addProduct(Shoes product) {
    liked_products.add(product);
    notifyListeners();
  }

  // double getTotalPrice() {
  //   double totalPrice = 0.0;
  //   for (var product in liked_products) {
  //     totalPrice += product.price;
  //   }
  //   return totalPrice;
  // }


  
}
// List<Product> products = [
//   Product(1,  ),
//   Product(3, ),
//   Product(2, ),
// ];


// void main() {
//   ProductList productList = ProductList();

//   // Get all products
//   List<Product> allProducts = productList.getAllProducts();
//   print('All Products:');
//   for (var product in allProducts) {
//     print('ID: ${product.id}, Name: ${product.name}, Price: \$${product.price}');
//   }

//   // Delete a product by ID (e.g., deleting Product 2)
//   int productIdToDelete = 2;
//   productList.deleteProductById(productIdToDelete);
//   print('\nProduct $productIdToDelete has been deleted.');

//   // Get the total price of all products
//   double totalPrice = productList.getTotalPrice();
//   print('\nTotal Price of All Products: \$${totalPrice.toStringAsFixed(2)}');
// }
