import 'package:flutter/material.dart';
import 'package:temp1/bottumNav.dart';


enum listType { recent, favourite }
class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {

   listType  status = listType.recent;

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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height ,
      width: MediaQuery.of(context).size.width,
      color: Color(0XFFFFE9E3),
      // color:   Colors.black.withOpacity(0),

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

                Image.asset( 'assets/Menu.png',height: 30,width: 30,)
                // IconButton(
                //   icon: Icon(Icons.menu),
                //   onPressed: () {},
                // ),
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
                            child:  GestureDetector(
                              onTap: toggleListType,
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
                                        color: status  == listType.recent?Colors.black: Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    Text('Recent',
                                        style: TextStyle(
                                         color: status  == listType.recent?Colors.black: Color.fromARGB(255, 151, 151, 151),

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
                              onTap: toggleListType,
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
                                        color: status  == listType.favourite?Colors.black: Colors.transparent,
                            
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    Text(
                                      'Favourite',
                                      style: TextStyle(
                                         color: status  == listType.favourite?Colors.black: Color.fromARGB(255, 151, 151, 151),

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
                        // list aof 5 item using pageview.builder()
                        Container(
                          // color: Color.fromARGB(136, 244, 67, 54),
                          height: 280,
                          width: double.infinity,
                          child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    height: 230,
                                    width: 200,
                                    margin: EdgeInsets.only(right: 30),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(255, 255, 47, 47)
                                                  .withOpacity(0.5),
                                          spreadRadius: 0,
                                          blurRadius: 40,
                                          offset: Offset(20, 12),
                                        ),

                                        
                                      ],
                                      color: Color.fromARGB(255, 255, 0, 0),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    // padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
                                    // alignment: Alignment.centerRight,
                                    // height: 10,
                                    // width: 20,
                                    child: Container(
                                        height: 230,
                                        width: 180,
                                        // padding: EdgeInsets.all(10),

                                        // put  gradient for container
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color.fromARGB(
                                                    0, 173, 173, 173),
                                                Color.fromARGB(255, 87, 87, 87),
                                              ],
                                            )),
                                        padding:
                                            EdgeInsets.fromLTRB(15, 0, 15, 15),
                                        // height:230,
                                        // width: 180,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Flexible(
                                              flex: 2,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "Say My",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Say My Name",
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
                                        ))

                                    //  Text('Your Playlist', style: TextStyle(
                                    //   fontSize: 20,
                                    //   fontWeight: FontWeight.w900,

                                    // ),
                                    // ),

                                    ),
                              );
                            },
                            controller: PageController(
                              viewportFraction: 0.8,
                              initialPage: 0,
                            ),
                          ),
                        ),

                        // list aof 5 item container  using listview.builder()
                        Container(
                          height: 290,
                          width: double.infinity,
                          child: ListView.builder(
                            // padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            // scrollDirection: Axis.vertical,
                            itemCount: 15,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(top: 0),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(0, 170, 143, 143),
                                  // borderRadius: BorderRadius.circular(40),
                                ),
                                // padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
                                // alignment: Alignment.centerRight,
                                // height: 10,
                                // width: 20,
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: 100,
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 133, 133, 133),
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                              'Say My Name',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              'David Guetta',
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