import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';
import 'package:temp1/data/data.dart';
import 'package:temp1/providers/fav_provider.dart';
import 'package:temp1/providers/songs_provider.dart';
import 'package:temp1/screens/screen1.dart';

class Screen2 extends StatefulWidget {
  final MusicModel singleMusic;
  const Screen2({super.key, required this.singleMusic});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final player = AudioPlayer();

  late MusicModel song1;

  Duration maxDuration = const Duration(seconds: 0);
  late ValueListenable<Duration> progress;

  bool isPlaying = true;
  bool isFav = false;
  bool isShuffle = false;
  bool isrepeat = false;

  @override
  void initState() {
    //     final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    song1 = widget.singleMusic;
    // //
    player.play(AssetSource(song1.path)).then((value) => getMaxDuration());

    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  getMaxDuration() {
    player.getDuration().then((value) {
      setState(() {
        print(" ======================  $value");
        maxDuration = value ?? const Duration(seconds: 0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // song provider
    final song_provider = Provider.of<Song_provider>(context, listen: false);
    // Provider.of<CartModel>(context, listen: false).removeAll();

// next song

    nextSong() {
// player.dispose();
      isPlaying = true;
      final next_song = song_provider.nextSong(song1);
      setState(() {
        song1 = next_song;
      });
      player.play(AssetSource(song1.path)).then((value) => getMaxDuration());
    }

// previous song

    previousSong() {
// player.dispose();
      isPlaying = true;

      final previous_song = song_provider.previousSong(song1);
      setState(() {
        song1 = previous_song;
      });
      player.play(AssetSource(song1.path)).then((value) => getMaxDuration());
    }

    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 0, 0, 0),
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
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,
                          color: Colors.white, size: 35)),

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
                  color: song1.colors[0], //==================  backgroung
                ),
                padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                // margin: EdgeInsets.only(top: 50),
                height: MediaQuery.of(context).size.height - 100,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    // container with image avatar and shadow

                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: song1.colors[1] //================== shadow
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
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(song1.cover),
                              fit: BoxFit.cover,
                            ),
                          ),
                        
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
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(0, 244, 67, 54),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                song1
                                    .musicName, //------------------------------------
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                song1
                                    .author, //------------------------------------
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Consumer<fav_provider>(
                                builder: (buildContext, fav_provider, widget) {
                              return IconButton(
                                  onPressed: () {
                                    setState(() {
                                      // isFav = !isFav;
                                      if (!isFav) {
                                        fav_provider.addFavProduct(song1);
                                        isFav = !isFav;
                                      } else {
                                        fav_provider.removeFavProduct(song1);
                                        isFav = !isFav;
                                      }
                                    });
                                  },
                                  icon: Icon(
                                      isFav
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      size: 30));
                            }),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    // seek bar
                    StreamBuilder(
                        stream: player.onPositionChanged,
                        builder: (context, snapshot) {
                          return ProgressBar(
                            baseBarColor: Colors.white,
                            progressBarColor:
                                const Color.fromARGB(255, 0, 0, 0),
                            bufferedBarColor:
                                Color.fromARGB(255, 122, 122, 122),
                            thumbColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            thumbRadius: 8,
                            timeLabelTextStyle: TextStyle(
                                color:
                                    const Color.fromARGB(255, 128, 128, 128)),
                            // barHeight: 10,
                            progress:
                                snapshot.data ?? const Duration(seconds: 0),
                            total: maxDuration,
                            onSeek: (duration) {
                              player.seek(duration);
                              setState(() {});
                            },
                          );
                        }),
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
                                      ? Color(
                                          0xff3B0044) //================== button
                                      : const Color.fromARGB(
                                          255, 165, 165, 165),
                                  size: 30)),
                          IconButton(
                              onPressed: () {
                                // song_provider.nextSong(song1);
                                previousSong();
                              },
                              icon: Icon(
                                Icons.skip_previous,
                                size: 40,
                                color: Color.fromARGB(255, 0, 0, 0),
                              )),
                          Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: song1.colors[1].withOpacity(
                                          0.5), //================== buttn shadow
                                      spreadRadius: 0,
                                      blurRadius: 20,
                                      offset: Offset(0, 12),
                                    ),
                                  ],
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              child: IconButton(
                                  onPressed: () {
                                    player.state == PlayerState.playing
                                        ? {
                                            player.pause(),
                                            setState(() {
                                              isPlaying = false;
                                            })
                                          }
                                        : {
                                            player.resume(),
                                            setState(() {
                                              isPlaying = true;
                                            })
                                          };
                                  },
                                  icon: Icon(
                                    isPlaying
                                        // player.state == PlayerState.paused
                                        ? Icons.pause
                                        : Icons.play_arrow_outlined,
                                    // isPlaying

                                    // player.state == PlayerState.playing
                                    //     ? Icons.play_arrow_outlined
                                    // : player.state == PlayerState.paused ?Icons.pause:Icons.play_arrow_outlined,
                                    size: 40,
                                    color: Colors.white,
                                  ))),
                          IconButton(
                              onPressed: () {
                                nextSong();
                              },
                              icon: Icon(
                                Icons.skip_next,
                                size: 40,
                                color: Color.fromARGB(255, 0, 0, 0),
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
