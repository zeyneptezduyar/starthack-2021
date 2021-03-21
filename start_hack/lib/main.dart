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
        primarySwatch: Colors.indigo,
        fontFamily: 'Epilogue'
    ),
    home: SignUp( camera: firstCamera),
  ));
}
