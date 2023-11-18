import 'package:day1/article.dart';
import 'package:day1/data.dart';
import 'package:day1/listArticle.dart';
import 'package:day1/provider/appProvider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Articles>? data_article ;
  @override
 
 

 
  @override
  Widget build(BuildContext context) {
     final appProviderVar = Provider.of<appProvider>(context,listen: false);
      data_article = appProviderVar.getData();




    return Scaffold(
      // primary: true,
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body:  data_article == null ? Center(child: CircularProgressIndicator(),) :
        
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                // app bar
                Container(
                  height: 100,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                AppLocalizations.of(context)!.appTitle1,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                               AppLocalizations.of(context)!.appTitle2,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
        
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color:Colors.yellow ,
                          image: DecorationImage(
                            
                            image: AssetImage('assets/profile.jpeg'),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                            color: Color.fromARGB(255, 195, 195, 195),
                            width: 1,
        
                          ),
                        ),
                      //   child: IconButton(
                      // icon:Image.asset('assets/profile.jpeg',  fit: BoxFit.cover,),
                      //     onPressed: () {
        
                         
                      //     },
                      //   ),
                      ),
                    ],
                  ),
                ),
                // search barr
                Container(
                  height: 50,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color.fromARGB(255, 195, 195, 195),
                              width: 1,
                            ),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 10),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 0, 0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
            
                // thumbanil
                Container(
                  height: 200,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image:
                          AssetImage(data_article!.last.image), // 'assets/t1.png'
                      fit: BoxFit.cover,
                    ),
                  ),
                  // child: Image.asset(
                  //   data_article.first.image,
                  //   fit: BoxFit.cover,
                  // ),
                ),
                GestureDetector(
                  onTap: () {
                    
                     Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Article_page(
                                article: data_article!.last, 
                                  ),
                                ),
                              );
                  },
                  child: Container(
                    height: 80,
                    margin: EdgeInsets.only(top: 10, left: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data_article!.last.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${data_article!.last.date} | ${data_article!.last.timeRequired}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //   devider
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 10),
                  height: 1,
                  width: MediaQuery.of(context).size.width - 70,
                  color: const Color.fromARGB(255, 195, 195, 195),
                ),
                //
                // container with row for "more" article and see all
                Container(
                  height: 30,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.moreArticles,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => list_article(),
                            ),
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.seeAll,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 137, 137, 137),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // list view
                Container(
                  height: 200,
                  child: ListView.builder(
                      itemCount: data_article!.length-2,
                      itemBuilder: (context, index) {
                        // return container  with image, title, time , date, reactions, and on click on the container
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Article_page(
                                  article: data_article![index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                              margin: EdgeInsets.only(top: 5),
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
                                image: AssetImage(data_article![index].image),
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
                                          Text(data_article![index].title, style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '${data_article![index].date} | ${data_article![index].timeRequired}',
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
                      }),
                )
              ],
            ),
          ),
        ),
      );
  
  }
}
