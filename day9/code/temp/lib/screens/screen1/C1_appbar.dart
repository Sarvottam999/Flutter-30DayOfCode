
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp/provider/cart_provider.dart';
import 'package:temp/screens/screen3_cart/S3_main.dart';

class CustomAppBar extends StatefulWidget {
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  @override
  void initState() {
    super.initState();
   
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 100,
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
                  Icons.clear_all,
                  color: Colors.black,
                  size: 30,
                ),

                iconSize: 22.0, // Adjust the icon size as per your design
                color: const Color.fromARGB(255, 255, 255,
                    255), // Adjust the icon color as per your design
                onPressed: () {
                  // Add your onPressed functionality here
                  print('Add button pressed');
                },
              ),
            ),
            Spacer(),
            Text(
              "shoebar",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Spacer(),
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
              margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              padding: EdgeInsets.all(5),
              child: Stack(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                      size: 30,
                    ),

                    iconSize: 22.0, // Adjust the icon size as per your design
                    color: const Color.fromARGB(255, 255, 255,
                        255), // Adjust the icon color as per your design
                    onPressed: () {
                       Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => S3_cart_main(  
                                  ),
                                ),
                              );
                      // Add your onPressed functionality here
                      print('cart button pressed');
                    },
                  ),
                
              Consumer<Cart_provider>(
                      builder: (context, value, child) =>  
                Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:value.get_total_no_of_items() == 0?Color.fromARGB(0, 0, 0, 0): Colors.red,
                    ),
                    child: Center(
                      child: Text(
                              value.get_total_no_of_items().toString(),
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 12,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                    ),
                  ),
             )
                ],
              ),
            ),
          ],
        ));
  }
}
