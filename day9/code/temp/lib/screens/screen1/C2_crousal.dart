// import 'package:day1/p1/data/shoes.dart';
// import 'package:day1/p1/screen2_cart/screen2_main.dart';
// import 'package:day1/p1/screen3/screen3_myCart.dart';
// import 'package:day1/p1/state/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp/data/shoes.dart';
import 'package:temp/provider/cart_provider.dart';
import 'package:temp/provider/products_provider.dart';
import 'package:temp/screens/screen2/S2_product_detail.dart';
import 'package:temp/screens/screen3_cart/S3_main.dart';
import 'package:temp/screens/temp.dart';

class C2_CarouselWithIndicator extends StatefulWidget {
  @override
  _C2_CarouselWithIndicatorState createState() => _C2_CarouselWithIndicatorState();
}

class _C2_CarouselWithIndicatorState extends State<C2_CarouselWithIndicator> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
 

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: Consumer<Product_provider>(builder: (context, cart, child) {
        return Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                itemCount: cart.getListPtoducs.length,
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return thumbnail_widget(
                    single_product: cart.getListPtoducs[index],
                  );
                },
              ),
            ),
            SizedBox(height: 2.0),
            PageViewIndicator(
              currentPage: _currentPage,
              pageCount: cart.getListPtoducs.length,
            ),
          ],
        );
      }),
    );
  }
}

class PageViewIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  PageViewIndicator({required this.currentPage, required this.pageCount});

  @override
  Widget build(BuildContext context) {
    List<Widget> indicators = [];
    for (int i = 0; i < pageCount; i++) {
      indicators.add(
        Container(
          width: 6.0,
          height: 6.0,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == currentPage ? Colors.blue : Colors.grey,
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }
}

class thumbnail_widget extends StatelessWidget {
  final Shoes single_product;
  const thumbnail_widget({super.key, required this.single_product});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
          // create a stack widget that will hold the image and a container that will hold the text and button vetically left aligned
          height: 250,
          width: 365,
          color: Color.fromARGB(0, 145, 145, 145),
          child: Stack(
            children: [
              // create a container that will hold the text and button vetically left aligned
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.all(30),
                  height: 150,
                  width: 365,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color(int.parse(single_product.colors[0])),
                        Color(int.parse(single_product.colors[1])),
 
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          softWrap: true,
                          single_product.name, // 'Nike Air Max 270',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              // temp_screen()
                              S2_product_detail(  product_id:single_product.id
                              ),
                            ),
                          );
                         
                        },
                        child: Container(
                          alignment: Alignment.center,
                          // padding: EdgeInsets.all(1),
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Color.fromARGB(255, 248, 248, 248),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Text(
                            'Explore Now',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // create a container that will hold the image
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 200,
                  width: 225,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(single_product.url),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
