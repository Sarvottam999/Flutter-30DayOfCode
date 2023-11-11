//  import '../data/shoes.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:temp1/data/data.dart';
 
class recent_provider extends ChangeNotifier{
        List<MusicModel> recent_song_list = [] ;
   

  void addRecentProduct(MusicModel product) {
    final newProducts = <MusicModel>[...recent_song_list, product];

    recent_song_list.replaceRange(0, recent_song_list.length, newProducts);
    // totalPrice = newTotalPrice;

    notifyListeners();
  }

 

   List get getRecentListPtoducs =>  [...recent_song_list];

   MusicModel getRecentProductById(int id) {
    return recent_song_list.firstWhere((p) => p.id == id);
 }
}
