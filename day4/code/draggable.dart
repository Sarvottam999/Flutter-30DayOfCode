import 'package:flutter/material.dart';


class DraggableScrollableSheetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DraggableScrollableSheet Demo'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.blueAccent,
            child: Center(
              child: Text(
                'Content Goes Here',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,   
            minChildSize: 0.1, 
            maxChildSize: 0.8, 
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                color: Colors.grey[200],
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 50,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}