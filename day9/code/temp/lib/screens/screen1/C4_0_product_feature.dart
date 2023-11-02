// import 'package:day1/p1/data/shoes.dart';
// import 'package:day1/p1/screen1_home/widgets/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:temp/data/shoes.dart';
import 'package:temp/screens/screen1/C4_1_slider_widget.dart';

class C4_0_productPage extends StatelessWidget {
    C4_0_productPage({super.key});

List<Shoes> shoes_product_list = shoesList ;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(0, 165, 165, 165),
      height: 320,
      width: MediaQuery.of(context).size.width ,
  
      // width: 300,
      child: PageView.builder(
// clipBehavior: Clip.antiAlias,

          itemCount: shoes_product_list.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
      height: 400,
      width: double.infinity,
      child: C4_1_slider_widget(  product: shoes_product_list[index]


      ),
       
    );
          },

          controller: PageController(
            viewportFraction: 0.6,
            initialPage: 0,
          ),
        ),
    )
;
  }

   
}

 