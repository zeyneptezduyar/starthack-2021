import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:http/http.dart' as http;
import 'login.dart';
import 'camera.dart';

class Loader {
  static var isLoaded = false;
  static var res = {
  };
}
class Home extends StatefulWidget {

  final CameraDescription camera;

  const Home({
    Key key,
    this.uid,
    @required this.camera,
  }) : super (key: key);

  final String uid;


  @override
  _HomeState createState() => _HomeState();

}
Future<Map> loader() async {
  http.StreamedResponse response = await load();
  var res = await response.stream.bytesToString();
  final Map parsed = json.decode(res);
  Loader.isLoaded = true;
  Loader.res = parsed;
  return parsed;
}
Future<Object>  load() async{
  var headers = {
    'Content-Type': 'application/json'
  };
  var request = http.Request('GET', Uri.parse('https://starthack2021-default-rtdb.europe-west1.firebasedatabase.app/data.json'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  return response;

}

List<Widget> getList(){
  //res.map((key, value) => Text(value[0]))


  var a = List<Widget>();

  Loader.res.forEach((key, value) {
    a.add(
      Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
            children: [
              ListTile(
              title:  Text("Food scanned: " + value['name']),
              subtitle: Text(
                "Contained " + value['calories'].toString() +  " calories!",
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.file(File(value['img'])),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'You scanned this food at: ' + value['time'].toString(),
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
          ],
        )));
  });


  return a;
}
  class _HomeState extends State<Home> {
  final String title = "Snack Log";
  var res;

  @override
  void initState(){
    super.initState();

    loader();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Color(0xfff8f1f1),
                fontSize: 30

            ),),
          backgroundColor: Color(0xff11698e),
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
                      MaterialPageRoute(builder: (context) => SignUp(camera: widget.camera,)),
                          (Route<dynamic> route) => false);
                });
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text("Welcome to the snack log!",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color(0xff666666),
                            fontSize: 25,


                        ),),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text("check out your logged snacks",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color(0xff000000),
                            fontSize: 20,


                          ),),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Card(
                    clipBehavior: Clip.antiAlias,
                      child: Column(
                      children: getList()

                    ),
                  )
                  ],
                ),
              ],
            ),
          ),
        ),
        drawer: NavigateDrawer(uid: widget.uid, camera: widget.camera));

  }
}

class NavigateDrawer extends StatefulWidget {

  final CameraDescription camera;

  const NavigateDrawer({
    Key key,
    this.uid,
    @required this.camera,
  }) : super (key: key);

  final String uid;

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
          DrawerHeader(
            child: Center(
              child: Text(
                  'SnackSnap',
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                      color: Colors.white,
                     fontSize: 40

                   ),
              ),
            ),
            decoration: BoxDecoration(
              color:  Color(0xff11698e)
            ),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.home, color: Color(0xff666666)),
              onPressed: () => null,
            ),
            title: Text('Home',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Color(0xff666666),
                  fontSize: 20

              ),),
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
              icon: new Icon(Icons.camera_enhance, color: Color(0xff666666)),
              onPressed: () => null,
            ),
            title: Text('Camera',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Color(0xff666666),
                  fontSize: 20

              ),),
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
              icon: new Icon(Icons.settings, color: Color(0xff666666),),
              onPressed: () => null,
            ),
            title: Text('Settings',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Color(0xff666666),
                  fontSize: 20

              ),),
            onTap: () {
              print(widget.uid);
            },
          ),
        ],
      ),
    );
  }
}