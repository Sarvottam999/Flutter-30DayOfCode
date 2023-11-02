import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp/data/shoes.dart';
import 'package:temp/provider/like_provider.dart';
 
 

class S4_main extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Liked_provider liked_provider = Provider.of<Liked_provider>(context);
List<Shoes>  like_list =  liked_provider.getAllProducts();

    return MaterialApp(
      home: Scaffold(
   
        body: Column(
          children: [
             Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 80,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Color.fromARGB(255, 230, 230, 230),
                        width: 1,
                      ),
                    ),
                    // margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    padding: EdgeInsets.all(5),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 30,
                      ),

                      iconSize: 22.0, // Adjust the icon size as per your design
                      color: const Color.fromARGB(255, 255, 255,
                          255), // Adjust the icon color as per your design
                      onPressed: () {
                        Navigator.pop(context);
                        // Add your onPressed functionality here
                        print('back button pressed');
                      },
                    ),
                  ),
                  Spacer(),
                  Text(
                    "My favourites",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 60,
                    height: 60,
                  )
                ],
              )),

            // ===========================================================================
      
         
         
            Container (
              height: MediaQuery.of(context).size.height - 160,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9, // Adjust as per your design
                ),
                itemCount: like_list.length,
                itemBuilder: (BuildContext context, int index) {
                  return like_item_widget(like_item: like_list[index]);
                },
              ),
            ),
        ],
        ),
      ),
    );
  }
}

class like_item_widget extends StatelessWidget {
  const like_item_widget({
    super.key,
    required this.like_item,
  });

  final Shoes like_item;

  @override
  Widget build(BuildContext context) {
    Liked_provider liked_provider 
  = Provider.of<Liked_provider>(context, listen: false);
    return Card(
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(like_item.url),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.favorite, color: Colors.red,),
              onPressed: () {
                // Add your favorite button functionality here
                liked_provider.deleteProductById(like_item.id);
                print('Favorite button pressed for ${like_item.name}');
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              padding: EdgeInsets.all(8),
              child: Text(
                like_item.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
