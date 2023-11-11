// provider for favourit song


//  import '../data/shoes.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:temp1/data/data.dart';
 
class fav_provider extends ChangeNotifier{
        List<MusicModel> fav_song_list = musics.reversed.toList() ;

 
  void addFavProduct(MusicModel product) {
    final newProducts = <MusicModel>[...fav_song_list, product];
    // final newTotalPrice = totalPrice + product.price;

    fav_song_list.replaceRange(0, fav_song_list.length, newProducts);
    // totalPrice = newTotalPrice;
print("${fav_song_list.length} +++++++++++++++++++++===");

    notifyListeners();
  }
 

  // function remove product from cart
  void removeFavProduct(MusicModel product) {
    final newProducts = fav_song_list.where((p) => p.id != product.id).toList();
    // final newTotalPrice = totalPrice - product.price;

    fav_song_list.replaceRange(0, fav_song_list.length, newProducts);
    // totalPrice = newTotalPrice;
print("${fav_song_list.length} ======================");

    notifyListeners();
  }

   List<MusicModel> get getFavListPtoducs =>  [...fav_song_list];

   MusicModel getFavProductById(int id) {
    return fav_song_list.firstWhere((p) => p.id == id);
 }
}
