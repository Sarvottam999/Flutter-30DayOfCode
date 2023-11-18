import 'package:day1/article.dart';
import 'package:day1/data.dart';
import 'package:day1/provider/appProvider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class list_article extends StatelessWidget {
  const list_article({super.key});

  @override
  Widget build(BuildContext context) {

    List<Articles> data_article = Provider.of<appProvider>(context, listen: false).getData();
    return Scaffold(
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),

      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),

        child: Column(
          children: [
            // app bar for list item article
            Container(
              // padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
              height: 100,
              width: double.infinity,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Container(
                    height: 50,
                    width: 50,

                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),

                  Text("Articles", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  ),
                 SizedBox(
                  width: 50,
                    height: 50,

                 )
                  // Container(
                  //   height: 50,
                  //   width: 50,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(50),
                  //     color: const Color.fromARGB(255, 0, 0, 0),
                  //   ),
                  //   child: IconButton(
                  //     icon: Icon(
                  //       Icons.bookmark_border,
                  //       color: Colors.white,
                  //     ),
                  //     onPressed: () {},
                  //   ),
                  // ),
                ],
              ),
            ),
         

         // list of all article
            Expanded(
                  child: ListView.builder(
                      itemCount: data_article.length,
                      itemBuilder: (context, index) {
                        // return container  with image, title, time , date, reactions, and on click on the container
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Article_page(
                                  article: data_article[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                              // margin: EdgeInsets.only(top: 5),
                              height: 100,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                image: AssetImage(data_article[index].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(data_article[index].title, style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '${data_article[index].date} | ${data_article[index].timeRequired} min read',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromARGB(
                                                  255, 0, 0, 0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        );
                      }))
              ],
        ),
      ),
    );
  }
}