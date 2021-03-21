
import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'dart:math' show Random;

import 'dart:async';
import 'dart:io';


import 'login.dart';
import 'home.dart';


class Camera extends StatefulWidget {

  final String uid;
  final CameraDescription camera;
  const Camera({
    Key key,
    this.uid,
    @required this.camera,
  }) : super (key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {

  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Camera"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut().then((res) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                          (Route<dynamic> route) => false);
                });
              },
            )
          ],
        ),
        body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the Future is complete, display the preview.
              return CameraPreview(_controller);
            } else {
              // Otherwise, display a loading indicator.
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt),
          // Provide an onPressed callback.
          onPressed: () async {

            // Take the Picture in a try / catch block. If anything goes wrong,
            // catch the error.
            try {
              // Ensure that the camera is initialized.
              await _initializeControllerFuture;


              // Attempt to take a picture and get the file `image`
              // where it was saved.
              final image = await _controller.takePicture();

              http.StreamedResponse response = await sendNudes(image?.path);


              var res = await response.stream.bytesToString();
              final Map parsed = json.decode(res);
              var name = parsed['items'][0]['item']['name'];
              var calories = parsed['items'][0]['item']['nutrition_facts'][0]['nutrition']['calories'];


              sendDic(name, calories, image?.path);

              String activities = computeActivity(calories);

              // If the picture was taken, display it on a new screen.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Center(
                    child: DisplayPictureScreen(
                      // Pass the automatically generated path to
                      // the DisplayPictureScreen widget.
                      imagePath: image?.path,
                      name: name,
                      calories: calories,
                      activities: activities,
                    ),
                  ),
                ),
              );

            } catch (e) {
              // If an error occurs, log the error to the console.
              print(e);
            }
          },
        ),
        drawer: NavigateDrawer(uid: widget.uid, camera: widget.camera));
  }
}
void sendDic(String name, double cal, String path) async{

  var headers = {
    'Content-Type': 'application/json'
  };
  var request = http.Request('POST', Uri.parse('https://starthack2021-default-rtdb.europe-west1.firebasedatabase.app/data.json'));
  request.body = '''{\r\n    "img":"$path",\r\n    "name":"$name",\r\n    "calories":$cal\r\n}''';
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
  print(response.reasonPhrase);
  }

}
String computeActivity(double calories){
    var weight = 70;

    var activities1 = {'running': 7, 'swimming': 6.5, 'of burpees': 10, 'of pushups': 8, 'cycling': 5,
      'dancing': 6, 'fishing': 1, 'of playing trombone': 0.5, 'walking': 3,
      'of squats': 6.1, 'of lunges': 6.3};

    var rand = new Random();
    var keys = activities1.keys.toList();

    var result = '';
    List<int> chosen = [];

    for (var i = 0; i < 3; i++) {
      var number = rand.nextInt(11);
      while (chosen.contains(number)) {
        number = rand.nextInt(11);
      }
      chosen.add(number);

      var name = keys[number];
      var met = activities1[name];
      var minutes = (calories * 200) / (met * 3.5 * weight);

      result += '\n' + minutes.round().toString() + ' minutes ' + name;
    }

    return result;
}

Future<Object> sendNudes(String path) async{
  var headers = {
  'Authorization': 'Bearer 8c35a7f0a5cf41a8d7e4c924e60dc7a04f08d006'
  };
  var request = http.MultipartRequest('POST', Uri.parse('https://api-beta.bite.ai/vision/'));
  request.files.add(await http.MultipartFile.fromPath('file', path));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();



  return response;
}

class DisplayPictureScreen extends StatelessWidget {

  final String imagePath;
  final name;
  final calories;
  final activities;

  const DisplayPictureScreen({Key key, this.imagePath, this.name, this.calories, this.activities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Results')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Center(
          child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      Image.file(File(imagePath)),
                      Text('Name: $name'),
                      Text('Has $calories calories'),
                      Text(activities)
                    ],
                  ))
          )
      ),
    );
  }
}

class NavigateDrawer extends StatefulWidget {
  final String uid;

  final CameraDescription camera;
  const NavigateDrawer({
    Key key,
    this.uid,
    @required this.camera,
  }) : super (key: key);
  @override
  _NavigateDrawerState createState() => _NavigateDrawerState();
}

class _NavigateDrawerState extends State<NavigateDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: FutureBuilder(
                future: FirebaseDatabase.instance
                    .reference()
                    .child("Users")
                    .child(widget.uid)
                    .once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.value['email']);
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            accountName: FutureBuilder(
                future: FirebaseDatabase.instance
                    .reference()
                    .child("Users")
                    .child(widget.uid)
                    .once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.value['name']);
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.home, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text('Home'),
            onTap: () {
              print(widget.uid);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home(uid: widget.uid, camera: widget.camera,)),
              );
            },
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.camera, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text('Camera'),
            onTap: () {
              print(widget.uid);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Camera(uid: widget.uid, camera: widget.camera)),
              );
            },
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.settings, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text('Settings'),
            onTap: () {
              print(widget.uid);
            },
          ),
        ],
      ),
    );
  }
}
