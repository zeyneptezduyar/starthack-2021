import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:camera/camera.dart';

import 'email_login.dart';
import 'email_signup.dart';

class SignUp extends StatelessWidget {
  final String title = "Sign Up";
  final CameraDescription camera;
  const SignUp({
    Key key,
    @required this.camera,
  }) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF8F1F1),
            Color(0xFF19456B),
          ],
        )),
        child: Scaffold(
            appBar: AppBar(
              title: Text('SnackSnap',
                  style: TextStyle(
                    color: Color(0xff19456b),
                    fontSize: 48,
                  )),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                        width: double.infinity,
                        height: 60,
                        child: FlatButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            color: Color(0xffF8F1F1),
                            onPressed: () {
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EmailSignUp(camera: camera)),
                              );
                            },
                            child: Text('Register',
                                style: TextStyle(
                                  color: Color(0xff11698E),
                                  fontSize: 24,
                                ))))),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                        width: double.infinity,
                        height: 60,
                        child: FlatButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            color: Color(0xffF8F1F1),
                            onPressed: () {
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EmailLogIn(camera: camera)),
                              );
                            },
                            child: Text('Login',
                                style: TextStyle(
                                  color: Color(0xff11698E),
                                  fontSize: 24,
                                )))))
              ]),
            )));

  }
}