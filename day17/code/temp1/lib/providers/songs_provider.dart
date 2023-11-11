//  import '../data/shoes.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:temp1/data/data.dart';
 
class Song_provider extends ChangeNotifier{
        List<MusicModel> _products = musics ;
  

  void addProduct(MusicModel product) {
    final newProducts = <MusicModel>[..._products, product];

    _products.replaceRange(0, _products.length, newProducts);

    notifyListeners();
  }


// create functon to get next song from given song with song
  MusicModel nextSong(MusicModel product) {
  
    int index = _products.indexOf(product);
    if(index == _products.length-1){
      return _products[0];
    }
    else{
      return _products[index+1];
    }
  }

// create functon to get previous song from given song with song
  MusicModel previousSong(MusicModel product) {
  
    int index = _products.indexOf(product);
    if(index == 0){
      return _products[_products.length-1];
    }
    else{
      return _products[index-1];
    }
  }


// function for setSong
  void setSong(MusicModel product) {
  
  }

 

   List get getListPtoducs =>  [..._products];

   MusicModel getProductById(int id) {
    return _products.firstWhere((p) => p.id == id);
 }
}
