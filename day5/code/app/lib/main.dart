// screens/color_list_screen.dart
import 'package:day1/action-color.dart';
import 'package:day1/cart-scren.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import '../store.dart';
// import './action-color.dart';






// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
// import 'screens/color_list_screen.dart';
// import 'screens/cart_screen.dart';
import 'store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<List<String>>(
      store: store,
      child: MaterialApp(
        title: 'Redux Color App',
        initialRoute: '/',
        routes: {
          '/': (context) => ColorListScreen(),
          '/cart': (context) => CartScreen(),
        },
      ),
    );
  }
}






class ColorListScreen extends StatelessWidget {

  final List<String> maincolors = [
    "red",
    "blue",
    "green",
    "yellow",
    "purple",
    "orange",
  ];

   final List<Color> phisicalcolors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
  ];
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<String>, List<String>>(
      converter: (store) => store.state,
      builder: (context, colors) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Color List'),
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
            ],
          ),
          body: ListView.builder(
        itemCount: maincolors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Add your action here
              print('Button for Color ${index + 1} tapped');
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              height: 100,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Row(
          crossAxisAlignment:   CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    color: phisicalcolors[index],
                  ),
                  Text(
                    ' ${maincolors[index]} Color',
                    style: TextStyle(
                      color: phisicalcolors[index] ,  //const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 0, 0, 0)),
                ),
                    // color: Colors.white
               
                    onPressed: () {
                      // Add your button action here
                      store.dispatch(AddToCartAction(maincolors[index]));
                      print('Button for Color ${index + 1} pressed');
                    },
                    // color: Colors.white,
                    child: Text(
                      'Add To Cart',
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      
          //  ListView.builder(
          //   itemCount: colors.length,
          //   itemBuilder: (context, index) {
          //     return ListTile(
          //       title: Text(colors[index]),
          //       trailing: ElevatedButton(
          //         onPressed: () {
          //           store.dispatch(AddToCartAction(colors[index]));
          //         },
          //         child: Text('Add to Cart'),
          //       ),
          //     );
          //   },
          // ),
        );
      },
    );
  }
}




// class ColorListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StoreConnector<List<String>, List<String>>(
//       converter: (store) => store.state,
//       builder: (context, colors) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text('Color List'),
//             actions: [
//               IconButton(
//                 icon: Icon(Icons.shopping_cart),
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/cart');
//                 },
//               ),
//             ],
//           ),
//           body: ListView.builder(
//             itemCount: colors.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(colors[index]),
//                 trailing: ElevatedButton(
//                   onPressed: () {
//                     store.dispatch(AddToCartAction(colors[index]));
//                   },
//                   child: Text('Add to Cart'),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
