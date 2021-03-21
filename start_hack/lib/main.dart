import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'SnackSnap',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: SignUp( camera: firstCamera),
  ));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;
  const MyApp({
    Key key,
    @required this.camera,
  }) : super (key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meet Up',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUp( camera: camera),
    );
  }
}