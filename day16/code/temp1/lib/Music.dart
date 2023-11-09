import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
// ...

class Music extends StatelessWidget {
    Music({super.key});
  @override
  Widget build(BuildContext context) {
final player = AudioPlayer();

    return  Center(
      // button to playe music
      child: Column(
        children: [
          ElevatedButton(
            child: Text('Play'),
            onPressed: () => player.play(AssetSource('s1.mp3')),
          ),

          // button to pause music
          ElevatedButton(
            child: Text('Pause'),
            onPressed: () => player.pause(),
          ),
        ],
      )
    );
  }
}