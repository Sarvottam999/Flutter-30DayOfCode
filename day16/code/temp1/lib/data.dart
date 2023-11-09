class MusicModel {
  final String musicName;
  final String author;
  final String cover;
  final String path;

  MusicModel(
      {required this.cover,
      required this.author,
      required this.musicName,
      required this.path});
}

List<MusicModel> musics = [
  MusicModel(
      cover: "assets/shoes/s1.png",
      author: "Konsta",
      musicName: "O'zbekistonlik",
      path: 's1.mp3'),
  MusicModel(
      cover: "assets/shoes/s2.png",
       author: "Konsta & Timur Alixanov",
      musicName: "Odamlar nima deydi?",
      path: 'so1.mp3'),
  MusicModel(
           cover: "assets/shoes/s3.png",
 author: "Jon Caryl ",
      musicName: "Alone",
      path: 's1.mp3'),
  MusicModel(
           cover: "assets/shoes/s4.png",
 author: "Konsta && Shokir ",
      musicName: "Poyga",
      path: 'so1.mp3'),
];