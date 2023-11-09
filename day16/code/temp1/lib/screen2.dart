import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  bool isPlaying = false;
  bool isFav = false;
  bool isShuffle = false;
  bool isrepeat = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff3B0044),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // code for navbar
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              height: 70,
              // color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios, color: Colors.white, size: 35),
                  Text(
                    "Now Playing",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 35,
                  ),

                  // IconButton(
                  //   icon: Icon(Icons.menu),
                  //   onPressed: () {},
                  // ),
                ],
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Color(0XFFFFE9E3),
                ),
                padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                // margin: EdgeInsets.only(top: 50),
                height: MediaQuery.of(context).size.height - 100,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    // container with image avatar and shadow

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 255, 47, 47)
                                .withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 40,
                            offset: Offset(0, 15),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Container(
                          height: 280,
                          width: 280,
                          child: Image.asset("assets/avtar.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),

                    // container with song name and artist name
                    Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(0, 244, 67, 54),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Say Your Name ",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Gardiend Halmoz",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isFav = !isFav;
                                  });
                                },
                                icon: Icon(
                                    isFav
                                        ? Icons.favorite_border
                                        : Icons.favorite,
                                    size: 30)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    // seek bar
                    ProgressBar(
                      baseBarColor: Colors.white,
                      progressBarColor: Colors.red,
                      bufferedBarColor: Colors.red[100],
                      thumbColor: const Color.fromARGB(255, 255, 255, 255),
                      thumbRadius: 8,
                      timeLabelTextStyle: TextStyle(
                          color: const Color.fromARGB(255, 128, 128, 128)),
                      // barHeight: 10,
                      progress: Duration(milliseconds: 1000),
                      buffered: Duration(milliseconds: 2000),
                      total: Duration(milliseconds: 5000),
                      onSeek: (duration) {
                        print('User selected a new time: $duration');
                      },
                    ),
                    // button for play and pause , next and previous, repeat and shuffle

                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05),
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          // color: Color.fromARGB(85, 248, 248, 248),
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  isShuffle = !isShuffle;
                                });
                              },
                              icon: Icon(Icons.shuffle,
                                  color: isShuffle
                                      ? Color(0xff3B0044)
                                      : const Color.fromARGB(
                                          255, 165, 165, 165),
                                  size: 30)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.skip_previous,
                                size: 40,
                                color: Color(0xff3B0044),
                              )),
                          Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.red.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 20,
                                      offset: Offset(0, 12),
                                    ),
                                  ],
                                  color: Color(0xff3B0044)),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPlaying = !isPlaying;
                                    });
                                  },
                                  icon: Icon(
                                    isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow_outlined,
                                    size: 40,
                                    color: Colors.white,
                                  ))),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.skip_next,
                                size: 40,
                                color: Color(0xff3B0044),
                              )),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  isrepeat = !isrepeat;
                                });
                              },
                              icon: Icon(Icons.repeat,
                                  color: isrepeat
                                      ? Color(0xff3B0044)
                                      : const Color.fromARGB(
                                          255, 165, 165, 165),
                                  size: 30)),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
