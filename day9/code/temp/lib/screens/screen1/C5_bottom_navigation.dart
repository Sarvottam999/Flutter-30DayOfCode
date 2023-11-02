import 'package:flutter/material.dart';
import 'package:temp/screens/screen4_favorite/S4_main.dart';

class C5_bottom_nav extends StatefulWidget {
  const C5_bottom_nav({super.key});

  @override
  State<C5_bottom_nav> createState() => _C5_bottom_navState();
}

class _C5_bottom_navState extends State<C5_bottom_nav> {

  // list of button name 
  List<String> buttonName = [
    'Home',
    'Shopping Cart',
    'Favorite',
    'Profile',
  ];

  String isActive = "none";
  @override
  Widget build(BuildContext context) {

    isActive = "Home";
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10),
                         padding: EdgeInsets.all(5),
                        height: 50,
                        width: MediaQuery.of(context).size.width -50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Color.fromARGB(255, 0, 0, 0),
                           ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(1),
                             decoration: BoxDecoration(
                          color: Color.fromARGB(0, 29, 29, 29),

                          borderRadius: BorderRadius.circular(15),
                            ),
                            child: IconButton(
                            
                              icon: Icon(   isActive == "Home" ?Icons.home:Icons.home_outlined ),
                              
                              iconSize: 22.0, // Adjust the icon size as per your design
                              color: const Color.fromARGB(255, 255, 255, 255), // Adjust the icon color as per your design
                              onPressed: () {  // Add your onPressed functionality here
                                print('Add button pressed');
                                 setState(() {
                                  
                                  isActive = "Home";
                                });
                              },
                            ),
                          )
                          ,
                          Container(
                             decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                           ),
                            child: IconButton(
                            // write code icon for shopping cart



                              icon: Icon( isActive == "Shopping Cart" ?Icons.shopping_bag:Icons.shopping_bag_outlined),
                              
                              iconSize: 22.0, // Adjust the icon size as per your design
                              color: const Color.fromARGB(255, 255, 255, 255), // Adjust the icon color as per your design
                              onPressed: () {  // Add your onPressed functionality here
                                print('Add button pressed');
                                 setState(() {
                                  
                                  isActive = "Shopping Cart";
                                });
                              },
                            ),
                          )
                          ,
                          Container(
                             decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                           ),
                            child: IconButton(
                            
                              icon: Icon( isActive == "Favorite" ?Icons.favorite:Icons.favorite_border_outlined ),
                              
                              iconSize: 22.0, // Adjust the icon size as per your design
                              color: const Color.fromARGB(255, 255, 255, 255), // Adjust the icon color as per your design
                              onPressed: () {  
                                
                                Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => S4_main(  
                              ),
                            ),
                          );// Add your onPressed functionality here
                                 setState(() {
                                  
                                  isActive = "Favorite";
                                });
                                print('Add button pressed');
                              },
                            ),
                          )
                          ,
                          Container(
                             decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                             ),
                            child: IconButton(
                            
                              icon: Icon( isActive == "Profile" ?Icons.person:Icons.person_2_outlined ),
                              
                              iconSize: 22.0, // Adjust the icon size as per your design
                              color: const Color.fromARGB(255, 255, 255, 255), // Adjust the icon color as per your design
                              onPressed: () { 
                                setState(() {
                                  
                                  isActive = "Profile";
                                });

                                print('Add button pressed');
                              },
                            ),
                          )
                          ],
                        ),
                      ),
    );
  }
}