import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp/provider/cart_provider.dart';

class S3_cart_main extends StatelessWidget {
  const S3_cart_main({super.key});

  @override
  Widget build(BuildContext context) {
     WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Cart_provider>(context, listen: false).delete_total_no_of_items();
    });


    return Scaffold(
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
                    "My Cart",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 60,
                    height: 60,
                  )
                ],
              )),
          Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              height: MediaQuery.of(context).size.height - 170,
              width: double.infinity,
              child: ProductList()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(
                          255, 255, 255, 255)), // Set the button color
                  foregroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 0, 0, 0)), // Set the text color
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Set border radius
                      side: BorderSide(
                          color: Color.fromARGB(255, 119, 119, 119),
                          width: 2.0), // Set border color and width
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(
                      Size(150.0, 50.0)), // Set minimum size
                ),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Text(
                        'Total amount',
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Color.fromARGB(255, 110, 110, 110)),
                      ),
                      Consumer<Cart_provider>(builder: (context, cart, child) {
                        return Text(
                          '\$ ${cart.getTotalPrice().toStringAsFixed(5)}',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 0, 0, 0)), // Set the button color
                  foregroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 255, 255, 255)), // Set the text color
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Set border radius
                      side: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                          width: 2.0), // Set border color and width
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(
                      Size(150.0, 50.0)), // Set minimum size
                ),
                onPressed: () {},
                child: Text(
                  'Buy Now',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
 

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
 
  @override
  Widget build(BuildContext context) {
    Cart_provider cart_provider = Provider.of<Cart_provider>(context, listen: true);
    List<Cart_Item>  cart_ptoducts = cart_provider.getAllItems();

    return ListView.builder(
      itemCount: cart_ptoducts.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductItem(
          product: cart_ptoducts[index],
          onDelete: () {
            // cart_provider.deleteItem(index);
            
            // setState(() {
              cart_provider.deleteItem(index);
            // });
          },
        );
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final Cart_Item product;
  final VoidCallback onDelete;

  ProductItem({required this.product, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(
                255, 196, 193, 193), // Set the color of the bottom border
            width: 2.0, // Set the width of the bottom border
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(int.parse(product.item.colors[0])),
                borderRadius: BorderRadius.circular(10.0)),
            height: 80.0,
            width: 80.0,
            child: Image.asset(
              product.item.url, // Replace with your image path
              height: 80.0,
              width: 80.0,
            ),
          ),
          SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            SizedBox(
                        width: 200,
                child: Text(
                  product.item.name,
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8.0),
              Text('\$${product.item.price.toString()}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 162, 0),
                    fontSize: 20.0,
                  )),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.delete,
                    color: const Color.fromARGB(255, 163, 163, 163)),
                onPressed: onDelete,
              ),
              Text(
                "x1",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 163, 163, 163)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
