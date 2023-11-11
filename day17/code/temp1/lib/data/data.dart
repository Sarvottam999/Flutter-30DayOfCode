import 'package:flutter/material.dart';

class MusicModel {
  final int id;
  final String musicName;
  final String author;
  final String cover;
  final String path;
  final List<Color> colors;

  MusicModel(
      {
      required this.id,

        required this.colors,
      required this.cover,
      required this.author,
      required this.musicName,
      required this.path});
}

List<MusicModel> musics = [
  MusicModel(
      id: 1,
      colors: [Color(0xffFFCFD0),Color(0xffE10003)],
      cover: "assets/songs/reds.jpg",
      author: "Konsta",
      musicName: "O'zbekistonlik",
      path: 'reds.mp3'),
  MusicModel(
      id: 2,
      colors: [Color(0xffC3D8EB), Color(0xff32638F)],
      cover: "assets/songs/b.jpg",
      author: "Arman Malik",
      musicName: "Sub Tera",
      path: 'b.mp3'),
  MusicModel(
      id: 3,
      colors: [Color(0xffFEEECC), Color(0xffFEA736)],
      cover: "assets/songs/k.jpg",
      author: "Arijit Singh",
      musicName: "Kesariya",
      path: 'k.mp3'),
  MusicModel(
      id: 4,
      colors: [Color(0xffCAD3C1), Color(0xff6F9363)],
      cover: "assets/songs/d.jpeg",
      author: "Armaan Malik ",
      musicName: "Jab Tak",
      path: 'd.mp3'),
];
