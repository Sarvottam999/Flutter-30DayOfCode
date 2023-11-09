import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:temp/main.dart';
import 'package:temp/previewPage.dart';


class CameraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: CameraScreen(),
    );
  }
}
 

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  XFile? _imageFile; // Variable to store the captured image

  @override
  void initState() {
    super.initState();
    _controller = CameraController(cameras![0], ResolutionPreset.medium);
    _initializeControllerFuture = _controller!.initialize();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void _takePicture() async {
    try {
      await _initializeControllerFuture;
      final XFile imageFile = await _controller!.takePicture();
      setState(() {
        _imageFile = imageFile;
      });
    } catch (e) {
      print("Error taking picture: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera App')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_controller!);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          
          Container(
            color: const Color.fromARGB(255, 0, 0, 0),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
          
                _imageFile != null
                ? GestureDetector(
                  onTap: () {
                    Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PreviewPage(
                    picture: _imageFile!,
                  )));    



     
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                      // padding: EdgeInsets.all(16.0),
                      child: Image.file(File(_imageFile!.path)),
                    ),
                )
                : Container(
                  height: 50,
                  width: 50,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
          
          
                ClipOval(
                
                  child: SizedBox(
                     height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: _takePicture,
                      child: Icon(Icons.camera),
                    ),
                  ),
                ),
            
          
                Container(
                  height: 50,
                  width: 50,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}