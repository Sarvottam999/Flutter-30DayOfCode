import 'package:flutter/material.dart';

class ListWheelScrollViewDemo extends StatelessWidget {
  final List<String> items = List.generate(50, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Demo'),
      ),
      body: ListWheelScrollView(
        itemExtent: 50,  
        children: items.map((item) {
          return ListTile(
            title: Text(item),
            onTap: () {
              print('Tapped on $item');
            },
          );
        }).toList(),
      ),
    );
  }
}
