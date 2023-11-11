import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp1/bottumNav.dart';
import 'package:temp1/data/data.dart';
import 'package:temp1/providers/fav_provider.dart';
import 'package:temp1/providers/resent_provider.dart';
import 'package:temp1/providers/songs_provider.dart';
import 'package:temp1/screens/screen2.dart';

enum listType { recent, favourite }

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  int currentPage = 0;
List<MusicModel> recentORfav = [] ;


  listType status = listType.favourite;
  Color backgroungColor = Color.fromARGB(255, 255, 255, 255);

// find out the color from the list of music using current page usinf for loop

  Color findColor() {
    for (int i = 0; i < musics.length; i++) {
      if (currentPage == i) {
        return musics[i].colors[0];
      }
    }
    return Colors.black;
  }

  // toggle list type
  void toggleListType() {
    setState(() {
      if (status == listType.recent) {
        status = listType.favourite;
      } else {
        status = listType.recent;
      }
    });
  }

  final PageController _pageController = PageController(
    viewportFraction: 0.8,
    // initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

    // Listen to page changes
    _pageController.addListener(() {
      // Update the current page when the page changes
      setState(() {
        currentPage = _pageController.page!.round();
        print(currentPage);
      });
    });
  }

// assign recentORfav array with musics on the base of status
  void assignRecentORfav( listType status) {
    switch (status) {
      case listType.recent:
      setState(() {
        recentORfav = Provider.of<recent_provider>(context, listen: false).recent_song_list;
        
      });
        break;
      case listType.favourite:
      setState(() {
        recentORfav = Provider.of<fav_provider>(context, listen: false).getFavListPtoducs;
        

      });
           
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Color(0XFFFFE9E3),
      color: findColor(),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // navigation bar
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            height: 100,
            // color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discover',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                Image.asset(
                  'assets/Menu.png',
                  height: 30,
                  width: 30,
                )
            
              ],
            ),
          ),
          // =====================================================================================================
          // bodyC
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    height: MediaQuery.of(context).size.height - 180,
                    width: 100,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              alignment: Alignment.centerRight,
                              height: 100,
                              width: 100,
                              color: Colors.red.withOpacity(0),
                              child: Text(
                                'Your Playlist',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: GestureDetector(
                              onTap: (){
                                
                                toggleListType();
                                assignRecentORfav(listType.recent);
                                
                                
                                },
                              child: Container(
                                alignment: Alignment.center,
                                height: 100,
                                width: 100,
                                // color: Colors.yellow,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 6,
                                      width: 6,
                                      decoration: BoxDecoration(
                                        color: status == listType.recent
                                            ? Colors.black
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    Text('Recent',
                                        style: TextStyle(
                                          color: status == listType.recent
                                              ? Colors.black
                                              : Color.fromARGB(
                                                  255, 151, 151, 151),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: GestureDetector(
                              onTap: (){
                                
                                toggleListType();
                              assignRecentORfav(listType.favourite);
                              
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 100,
                                width: 100,
                                // color: Colors.yellow,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 6,
                                      width: 6,
                                      decoration: BoxDecoration(
                                        // color: Colors.black,
                                        color: status == listType.favourite
                                            ? Colors.black
                                            : Colors.transparent,

                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    Text(
                                      'Favourite',
                                      style: TextStyle(
                                        color: status == listType.favourite
                                            ? Colors.black
                                            : Color.fromARGB(
                                                255, 151, 151, 151),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              Expanded(
                flex: 4,
                child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    height: MediaQuery.of(context).size.height - 200,
                    width: 100,
                    color: Color.fromARGB(0, 255, 255, 255),
                    child: Column(
                      children: [
                        Container(
                          height: 280,
                          width: double.infinity,
                          child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: musics.length,
                              itemBuilder: (context, index) {
                                return Align(
                                  alignment: Alignment.topLeft,
                                  child: GestureDetector(
                                        onTap: () {
                                         Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => Screen2(singleMusic: musics[index],),
                                                  ),
                                                );
                                          //     .setSong(musics[index]);
                                        },
                                    child: Container(
                                        height: 230,
                                        width: 200,
                                        margin: EdgeInsets.only(right: 30),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:currentPage == index ?  musics[index].colors[
                                                  1]: Colors.transparent, // ---------------------------------------
                                              
                                              spreadRadius: 0,
                                              blurRadius: 40,
                                              offset: Offset(20, 12),
                                            ),
                                          ],
                                           borderRadius: BorderRadius.circular(40),
                                        ),
                                       
                                        child: GestureDetector(
                                          
                                          child: Container(
                                              height: 230,
                                              width: 180,
                                        
                                               decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        musics[index].cover),
                                                
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                            
                                                  ),
                                            
                                              child: Container(
                                                height: 230,
                                              width: 180,
                                              padding: EdgeInsets.fromLTRB(
                                                  15, 0, 15, 15),
                                        
                                            decoration: BoxDecoration(  
                                               borderRadius:
                                                      BorderRadius.circular(40),
                                               gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomRight,
                                                    colors: [
                                                      Color.fromARGB(0, 173, 173, 173).withOpacity(0),
                                                      Color.fromARGB(255, 0, 0, 0)
                                                          .withOpacity(1),
                                                    ],
                                                  )
                                        
                                            ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Flexible(
                                                      flex: 2,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.end,
                                                        children: [
                                                          Text(
                                                           musics[index].musicName,
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                            ),
                                                          ),
                                                          Text(
                                                           musics[index].author,
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                              
                                                    // icon for play
                                                    Flexible(
                                                      flex: 1,
                                                      child: IconButton(
                                                        icon: Icon(
                                                          color: Colors.white,
                                                          Icons
                                                              .play_circle_fill_rounded,
                                                          size: 45,
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        )
                                  
                                     
                                  
                                        ),
                                  ),
                                );
                              },
                              controller: _pageController
 
                              ),
                        ),

                        // list aof 5 item container  using listview.builder()
                        Container(
                          height: 290,
                          width: double.infinity,
                          child: ListView.builder( 
                            itemCount: recentORfav.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(top: 0),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(0, 170, 143, 143),
                                  // borderRadius: BorderRadius.circular(40),
                                ),
                            
                             child: GestureDetector(
                                        onTap: () {
                                         Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => Screen2(singleMusic: recentORfav[index],),
                                                  ),
                                                );
                                          //     .setSong(musics[index]);
                                        },
                               child: Container(
                                      padding: EdgeInsets.all(4),
                                      height: 100,
                                      width: double.infinity,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                               image: DecorationImage(
                                                  image: AssetImage(
                                                      recentORfav[index].cover),
                                                  // image: AssetImage("assets/b1.jpeg"),
                                                  //
                                                  fit: BoxFit.cover,
                                                ),
                                              color:
                                                  Color.fromARGB(255, 65, 65, 65),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                               recentORfav[index].musicName,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                recentORfav[index].author,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          IconButton(
                                            icon: Icon(
                                                Icons.play_circle_fill_rounded),
                                            onPressed: () {},
                                          )
                                        ],
                                      )),
                             ),
                              );
                            },
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),

          // =====================================================================================================

          C5_bottom_nav()
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}


class ScreenArguments {
  final MusicModel singleMusic;

  ScreenArguments(this.singleMusic);
}