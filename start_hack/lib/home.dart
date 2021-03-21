import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:http/http.dart' as http;
import 'login.dart';
import 'camera.dart';

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
void load() async{
  var headers = {
    'Content-Type': 'application/json'
  };
  var request = http.Request('GET', Uri.parse('https://starthack2021-default-rtdb.europe-west1.firebasedatabase.app/data.json'));
  request.body = '''{\r\n    "hi":"work"\r\n}''';
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
    print(response.reasonPhrase);
  }

}
  class _HomeState extends State<Home> {
  final String title = "Home";


  @override
  void initState(){
    super.initState();

    load();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Card(
                clipBehavior: Clip.antiAlias,
                  child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.arrow_drop_down_circle),
                      title: const Text('Food entry: pasta'),
                      subtitle: Text(
                      'Food entered on 20/03',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                      ),
                      Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                      'You scanned this food',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                      ),
                  ],
                ),
              ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: const Text('Food entry: pasta'),
                        subtitle: Text(
                          'Food entered on 20/03',
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'You scanned this food',
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: const Text('Food entry: pasta'),
                        subtitle: Text(
                          'Food entered on 20/03',
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'You scanned this food',
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: const Text('Food entry: pasta'),
                        subtitle: Text(
                          'Food entered on 20/03',
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'You scanned this food',
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: const Text('Food entry: pasta'),
                        subtitle: Text(
                          'Food entered on 20/03',
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'You scanned this food',
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: const Text('Food entry: pasta'),
                        subtitle: Text(
                          'Food entered on 20/03',
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'You scanned this food',
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: const Text('Food entry: pasta'),
                        subtitle: Text(
                          'Food entered on 20/03',
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'You scanned this food',
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: const Text('Food entry: pasta'),
                        subtitle: Text(
                          'Food entered on 20/03',
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'You scanned this food',
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
          },
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
              icon: new Icon(Icons.camera_enhance, color: Colors.black),
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