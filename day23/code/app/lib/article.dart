 
import 'package:day1/data.dart';
import 'package:day1/provider/appProvider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Article_page extends StatefulWidget {
  final Articles article;
    Article_page({super.key, required this.article}) ;

  @override
  State<Article_page> createState() => _Article_pageState();
}

class _Article_pageState extends State<Article_page> {
  bool isBookmark = false;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
// provider

     List<Articles> data_article = Provider .of<appProvider>(context, listen: false).getData();

    // final article = data_article.first;

    // print(temperatures.first.text);
    return Scaffold(
      body: Column(
        children: [
      
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: 80,
            width: double.infinity,
            // color: Color.fromARGB(255, 255, 145, 145),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    
                    },
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  child: IconButton(
                    icon: Icon(
                     isBookmark ? Icons.bookmark: Icons.bookmark_border,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isBookmark = !isBookmark;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              height: MediaQuery.of(context).size.height -40,
              padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
              // color: Color.fromARGB(255, 255, 229, 229),
              child: Column(
                children: [
                  // app bar with back button and bookmark buttin
              
                  
              
              // container with image
                 Container(
                           
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                      //  color: Color.fromARGB(255, 66, 66, 66),
                       image: DecorationImage(
                         image: AssetImage(widget.article.image),
                         fit: BoxFit.cover,
                       ),
                     ),
                     height: 200,
                     width: double.infinity,
                     child: Container()
                     // Image.asset('assets/t1.png', fit: BoxFit.cover,),
                     ),
                // date , time to read in row
                Container(
                  // color: Color.fromARGB(255, 87, 87, 87),
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.article.date,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        '${widget.article.timeRequired}',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                  // title
                  Container(
                        // color: Color.fromARGB(255, 103, 0, 0),
                
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text( widget.article.title,  style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  // author
               
                  // text
                  Flexible(
                    flex: 4,
                    child:
                  //    ConstrainedBox(constraints: isExpanded
                  // ?   BoxConstraints()
                  // :   BoxConstraints(maxHeight: 50.0),)
                    
                    
                    Container(
                      constraints: isExpanded
                  ?   BoxConstraints()
                  :   BoxConstraints(maxHeight: 200.0),
                          // color: Color.fromARGB(255, 255, 64, 64),
                
                      height: 400,
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: SingleChildScrollView(
          
                        child: Text( widget.article.text,  style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            // maximux 10 lines to show
                            // overflow: TextOverflow.clip,
                            // : true,
          
                                  overflow: TextOverflow.fade,
                            height: 1.3,
                            
                          ),
                            maxLines: isExpanded ? null : 6,
          
                        ),
                      ),
                    ),
                  ),
                
              
                // read more button
                isExpanded ? Container() :
                 Flexible(
                   child: Container(
                  
                     margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                     height: 60,
                                 alignment:   Alignment.center,
                     width: double.infinity,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: Color.fromARGB(255, 0, 0, 0),
                     ),
                               
                    //  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                     child: TextButton(
                       
                       onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                
                          print(isExpanded);
                        });
                       },
                       child: 
                       Text( 
                      //"hhhh", 
                               
                           AppLocalizations.of(context)!.readMore,

                         style: TextStyle(
                           fontSize: 15,
                           fontWeight: FontWeight.w600,
                           color: Color.fromARGB(255, 255, 255, 255),
                         ),
                       ),
                     ),
                   ),
                 ),
              
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
