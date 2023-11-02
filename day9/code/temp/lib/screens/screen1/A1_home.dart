// import 'package:day1/p1/Constant.dart';
// import 'package:day1/p1/screen1_home/widgets/a5_bottom_navigation.dart';
// import 'package:day1/p1/screen1_home/widgets/a3_filters.dart';
// import 'package:day1/p1/screen1_home/widgets/a2_CarouselWithIndicator.dart';
// import 'package:day1/p1/screen1_home/widgets/a4_product_feature.dart';
// import 'package:day1/p1/screen1_home/widgets/slider_widget.dart';
import 'package:temp/screens/screen1/C5_bottom_navigation.dart';
import 'package:temp/screens/screen1/C2_crousal.dart';
import 'package:temp/screens/screen1/C3_filter.dart';
import 'package:temp/screens/screen1/C4_0_product_feature.dart';
import 'package:temp/screens/screen1/C4_1_slider_widget.dart';

import 'C1_appbar.dart';
import 'package:flutter/material.dart';

class A1_home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(),
              C2_CarouselWithIndicator(),
              C3_filter(),
               C4_0_productPage(),
              C5_bottom_nav()
              //
            ],
          ),
        ),
      ),
    );
  }
}
