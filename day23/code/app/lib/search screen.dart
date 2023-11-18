import 'package:flutter/material.dart';

class searchscreen extends StatefulWidget {
  const searchscreen({super.key});

  @override
  State<searchscreen> createState() => _searchscreenState();
}

class _searchscreenState extends State<searchscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Search Demo'),
        ),
        //  The Builder widget is used to obtain a new BuildContext.
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            child: const Icon(Icons.search),
            onPressed: () async {
              await showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ),
      ),
    );
}
}




class CustomSearchDelegate extends SearchDelegate<String> {
  // Dummy list
  final List<String> searchList = [
    "Apple",
    "Banana",
    "Cherry",
    "Date",
    "Fig",
    "Grapes",
    "Kiwi",
    "Lemon",
    "Mango",
    "Orange",
    "Papaya",
    "Your attention didn’t collapse. It was stolen",
    "Why you should really stop charging your phone overnight",
    "A Guide to Getting Rid of Almost Everything",
    "A Neurologist’s Tips to Protect Your Memory",
  ];

  // These methods are mandatory you cannot skip them.

  @override
  List<Widget> buildActions(BuildContext context) {
    // Build the clear button.
     return [
    IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        query = '';
        // When pressed here the query will be cleared from the search bar.
      },
    ),
  ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Build the leading icon.
      return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
        // Exit from the search screen.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Build the search results.
    final List<String> searchResults = searchList
      .where((item) => item.toLowerCase().contains(query.toLowerCase()))
      .toList();
  return ListView.builder(
    itemCount: searchResults.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(searchResults[index]),
        onTap: () {
          // Handle the selected search result.
          close(context, searchResults[index]);
        },
      );
    },
  );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Build the search suggestions.
     final List<String> suggestionList = query.isEmpty
      ? []
      : searchList
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();

  return ListView.builder(
    itemCount: suggestionList.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(suggestionList[index]),
        onTap: () {
          query = suggestionList[index];
          // Show the search results based on the selected suggestion.
        },
      );
    },
  );
  }
}