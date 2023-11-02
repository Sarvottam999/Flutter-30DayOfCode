import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp/data/shoes.dart';
import 'package:temp/provider/cart_provider.dart';
import 'package:temp/provider/like_provider.dart';
import 'package:temp/provider/products_provider.dart';
 
class S2_product_detail extends StatefulWidget {
  final int product_id;
  S2_product_detail({super.key , required this.product_id});

  @override
  State<S2_product_detail> createState() => _S2_product_detailState();
}

class _S2_product_detailState extends State<S2_product_detail> {
  bool favorite_selected = false;
  Color color_selected = Colors.red;
String selected_size_status = "S";
int selected_quantity_status = 0;

   void increaseQuatity(){
    setState(() {
      selected_quantity_status++;
    });
  }

  void decreaseQuatity(){
    if (selected_quantity_status > 0) {
       setState(() {
      selected_quantity_status--;
    });
      
    }
   
  }
  @override
  Widget build(BuildContext context) {
Shoes product =   Provider.of<Product_provider>(context,  listen: false).getProductById(widget.product_id);

    return  Scaffold(

      body: Builder(
        builder: (context) {
          return Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(int.parse(product.colors[0])),
                      Color(int.parse(product.colors[1])),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        height: 100,
                        color: Color.fromARGB(0, 255, 255, 255),
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
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
                            Spacer(),
                            Consumer<Liked_provider>(builder: (context, value, child) {
                              return Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Color.fromARGB(255, 230, 230, 230),
                                  width: 1,
                                ),
                              ),
                              margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                              padding: EdgeInsets.all(5),
                              child: IconButton(
                                icon: Icon(
                                 favorite_selected ? Icons.favorite:Icons.favorite_border_outlined,
                                  color:favorite_selected ? Colors.red: Colors.black,
                                  size: 30,
                                ),
    
                                iconSize: 22.0, // Adjust the icon size as per your design
                                color: const Color.fromARGB(255, 255, 255,
                                    255), // Adjust the icon color as per your design
                                onPressed: () {
                                  if (favorite_selected) {
                                   value.deleteProductById(product.id);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Removed from favorites!'),
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                  } else {
                                    value.addProduct(product);
                                  }
                                  // Add your onPressed functionality here
    
                                  setState(() {
                                    
                                    favorite_selected = !favorite_selected;
                                  });
                                  print('favotite button pressed');
                                },
                              ),
                            );
                         
                              
                            },)
                             ],
                        )),
    
                GestureDetector(
                  child: Container(
                    child: Image.asset(product.url, fit: BoxFit.cover),
                  ),
                  onTap: () {
                    Scaffold.of(context).showBottomSheet (
                    // context:  context,
                      // clipBehavior: Clip.antiAlias,
                      backgroundColor: Colors.transparent,
    
                   (BuildContext context) {
                            
                        return  MyStatelessWidget2(product: product);
// ----------------------------------------------------------------
                        // return   CustomBottomSheet('Data to Send');
                  });
                  },
                ),

    // ElevatedButton(
    //               onPressed: () {
    //                 _showBottomSheet(context);
    //               },
    //               child: Text('Show Bottom Sheet'),
    //             )
                    ],
                )
          );
        }
      )

    )  ;
      
      
      }

//       void _showBottomSheet(BuildContext context) {
//   Scaffold.of(context).showBottomSheet(
//     (context) => CustomBottomSheet('Data to Send'),
//   );
// }
}
class CustomBottomSheet extends StatelessWidget {
  final String data;

  CustomBottomSheet(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
      child: Center(
        child: Text(data),
      ),
    );
  }
}




class MyStatelessWidget2 extends StatefulWidget {
 final Shoes product;

  MyStatelessWidget2({super.key , required this.product}); 

  @override
  State<MyStatelessWidget2> createState() => _MyStatelessWidget2State();
}

class _MyStatelessWidget2State extends State<MyStatelessWidget2> {
  Color color_selected = Colors.red;
String selected_size_status = "S";
int selected_quantity_status = 1;



  // Shoes simgle_data = Shoes(
  //     name: "Comfort X1 Running Shoes",
  //     company: "StrideRite",
  //     rating: 4.5,
  //     description:
  //         " we are here to help you to make progress and not giving you demotivationwe are here to help you to make progress and not giving you demotivationwe are here to help you to make progress and not giving you demotivationwe are here to help you to make progress and not giving you demotivation ",
  //     size: [8, 9, 10, 11],
  //     colors: ["0xff61E2EF", "0xff0C6391"],
  //     price: 79.99,
  //     date: DateTime.parse("2023-02-15"),
  //     url: "assets/shoes/s1.png");

  List shoes_size_list = ["S", "M", "L", "XL"];
  //list of color
  List shoes_color_list = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.green,
  ];

  void increaseQuatity(){

    
    setState(() {
      selected_quantity_status++;
    });
  }

  void decreaseQuatity(){
    if (selected_quantity_status > 1) {
       setState(() {
      selected_quantity_status--;
    });
      
    }
   
  }
  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "Comfort X1 Running Shoes",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            height: 45,
                            width: 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 230, 230, 230),
                                      width: 1,
                                    ),
                                  ),
                                  // margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                                  padding: EdgeInsets.all(1),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size: 20,
                                    ),
    
                                    iconSize:
                                        22.0, // Adjust the icon size as per your design
                                    color: const Color.fromARGB(255, 255, 255,
                                        255), // Adjust the icon color as per your design
                                    onPressed: increaseQuatity,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  selected_quantity_status.toString(),
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 230, 230, 230),
                                      width: 1,
                                    ),
                                  ),
                                  // margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                                  padding: EdgeInsets.all(1),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                      size: 20,
                                    ),
    
                                    iconSize:
                                        22.0, // Adjust the icon size as per your design
                                    color: const Color.fromARGB(255, 255, 255,
                                        255), // Adjust the icon color as per your design
                                    onPressed: decreaseQuatity,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      //  =============== ratings -----------
                      SizedBox(
                        height: 5,
                      ),
    
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Ratings: 5.0 "),
                          Text("(7,932)",  style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 50, 115, 255),
                                          fontWeight: FontWeight.w700,
                                          overflow: TextOverflow.clip),),
                        ]
                      ),
                      SizedBox(
                        height: 9,
                      ),
    
                      Container(
                        height: 50,
                        child: Stack(
                          children: [
                            Container(
                              color: const Color.fromARGB(31, 255, 255, 255),
                              // height: 50,
                              // width: double.infinity,
                              child: Text(
                               widget. product.description,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 148, 148, 148)),
                              ),
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                    height: 15,
                                    width: 100,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    child: Text(
                                      "Read more...",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontWeight: FontWeight.w700,
                                          overflow: TextOverflow.clip),
                                    ))),
                          ],
                        ),
                      ),
                      // ================  size ===============
    
                      SizedBox(height: 10),
                      Text(
                        "Choose Size",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.clip),
                      ),
    
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        width: MediaQuery.of(context).size.width / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (var item in shoes_size_list)
                              size_button_widget(
                                selected_size: selected_size_status,
                                size: item,
                                onPressed: () {
                                setState(() {
                                  
                                  selected_size_status = item;
                                });
                              }, )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
    
                      // ================  color ===============
                      Text(
                        "Choose Color",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.clip),
                      ),
    
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (var color in shoes_color_list)
                              shoes_color_widget(
                                color_selected: color_selected,
                                onPressed: () {
                                  setState(() {
                                  color_selected = color;
                                    
                                  });
                                },
                                color: color,
                              )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
    
                      Divider(
                        height: 2,
                        color: const Color.fromARGB(255, 202, 202, 202),
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      SizedBox(height: 10),
    
                      // =================================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Price :",
                                  style: TextStyle(
                                      // fontSize: 22,
                                      color: Color.fromARGB(255, 150, 150, 150),
                                      fontWeight: FontWeight.w700,
                                      overflow: TextOverflow.clip)),
                              Text("\$ ${widget.product.price}",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w700,
                                      overflow: TextOverflow.clip)),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              
                              Provider.of<Cart_provider>(context, listen: false)
                              .addcartProduct(Cart_Item(
                                  selected_quantity_status,
                                  selected_size_status,
                                  widget.product
                                  ));
                              Navigator.pop(context);
                        
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
                              height: 48,
                              width: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: Color.fromARGB(255, 0, 0, 0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.shopping_bag_outlined),
                              
                                    iconSize:
                                        22.0, // Adjust the icon size as per your design
                                    color: Color.fromARGB(255, 255, 255,
                                        255), // Adjust the icon color as per your design
                                    onPressed: () {
                                      // Add your onPressed functionality here
                                      print('Add button pressed');
                                    },
                                  ),
                                  Text(
                                    //  "hhhh",
                                    "Add To Cart", //************** price ****** */
                                    style: TextStyle(
                                      color: const Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
    
  }
   
  }
 
// Widget size_button_widget(String text) {

class size_button_widget extends StatelessWidget {
  final String selected_size;
  final VoidCallback onPressed;
  final String size;
 

  size_button_widget({
    required this.selected_size,
    required this.onPressed,
    required this.size  
  });

  @override
  Widget build(BuildContext context) {
    return Container(


    height: 40,
    width: 40,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      border: Border.all(
        color: Color.fromARGB(255, 230, 230, 230),
        width: 1,
      ),
      color:selected_size == this.size?   Color.fromARGB(255, 0, 0, 0): const Color.fromARGB( 255, 255, 255, 255), // Adjust the icon color as per your design
 
    ),
    // margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
    padding: EdgeInsets.all(1),
    child: IconButton(
      icon: Text(
        size,
        style: TextStyle(
            fontSize: 15,
      color:selected_size == this.size?  const Color.fromARGB( 255, 255, 255, 255): Color.fromARGB(255, 0, 0, 0), // Adjust the icon color as per your design

            // color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w700,
            overflow: TextOverflow.clip),
      ),

      iconSize: 22.0, // Adjust the icon size as per your design
      // color:selected_size == this.size?  const Color.fromARGB( 255, 255, 255, 255): Color.fromARGB(255, 0, 0, 0), // Adjust the icon color as per your design
      onPressed: onPressed,
    ),
  );
}

}
class shoes_color_widget extends StatelessWidget {
  final Color color_selected;
  final VoidCallback onPressed;
  final Color color;

  shoes_color_widget({
    required this.color_selected,
    required this.onPressed,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      child: Align(
        child: IconButton(
          icon: Icon(Icons.check, color: color_selected == this.color? Colors.white:color, size: 14),
          iconSize: 22.0,
          color: color,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
