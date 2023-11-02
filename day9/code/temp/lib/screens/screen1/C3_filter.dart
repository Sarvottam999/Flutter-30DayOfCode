import 'package:flutter/material.dart';

class C3_filter extends StatelessWidget {
    C3_filter({super.key});

//  create array of strings
  final List<String> Categories = [
    'Popular',
    'Men',
    'Kids',
    'Women',
  ];
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.only(top: 10),
      color: Color.fromARGB(0, 192, 192, 192),
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // creating list of container in row usinf map function
          ...List.generate(
            4,
            (index) => Flexible(
              child: Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Categories[index] == 'Popular' ? Colors.white: Colors.black,
                  ),
                  color: Categories[index] == 'Popular' ?Colors.black: Colors.white,
                ),
                child: Center(
                  child: Text(
                    Categories[index],
                    style: TextStyle(
                      color: Categories[index] == 'Popular' ?Colors.white:Colors.black,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
          ),
    
          // filter_button(),   


          




    
     
    
        ],
      ),
    );
  }
}

 


// write code to see if a catorie is in firts place 

// if (Categories[0] == 'Popular') {
//   print('yes');
// } else { 
//   print('no');
// }






