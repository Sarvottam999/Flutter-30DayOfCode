import 'package:flutter/material.dart';


class InfiniteScrollDemo extends StatefulWidget {
  @override
  _InfiniteScrollDemoState createState() => _InfiniteScrollDemoState();
}

class _InfiniteScrollDemoState extends State<InfiniteScrollDemo> {
  List<String> items = List.generate(20, (index) => 'Item $index');

  ScrollController _scrollController = ScrollController();

  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
       _loadMoreItems();
    }
  }

  void _loadMoreItems() {
    if (!_loading) {
      setState(() {
        _loading = true;
      });

       Future.delayed(Duration(seconds: 2), () {
        setState(() {
          items.addAll(List.generate(10, (index) => 'Item ${items.length}'));
          _loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite Scrolling Demo'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index == items.length) {
            return _loading ? Center(child: CircularProgressIndicator()) : Container();
          } else {
            return ListTile(
              title: Text(items[index]),
            );
          }
        },
      ),
    );
  }
}