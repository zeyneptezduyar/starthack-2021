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
<<<<<<< HEAD
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFF8F1F1),
                Color(0xFF19456B),
              ],
            )),
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 250,
              title: Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                height: 250,
                child: Image(image: AssetImage('assets/logo.png'),),
              ),
=======
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
>>>>>>> 9b085bd3468e466b8f880489df733954990ddc89
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
<<<<<<< HEAD

=======
>>>>>>> 9b085bd3468e466b8f880489df733954990ddc89
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                        width: double.infinity,
                        height: 60,
                        child: FlatButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            color: Color(0xffF8F1F1),
                            onPressed: () {
<<<<<<< HEAD
                              Navigator.push(
=======
                                Navigator.push(
>>>>>>> 9b085bd3468e466b8f880489df733954990ddc89
                                context,
                                MaterialPageRoute(builder: (context) => EmailSignUp(camera: camera)),
                              );
                            },
                            child: Text('Register',
                                style: TextStyle(
<<<<<<< HEAD
                                  color: Color(0xff19456b),
=======
                                  color: Color(0xff11698E),
>>>>>>> 9b085bd3468e466b8f880489df733954990ddc89
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
<<<<<<< HEAD
                              Navigator.push(
=======
                                Navigator.push(
>>>>>>> 9b085bd3468e466b8f880489df733954990ddc89
                                context,
                                MaterialPageRoute(builder: (context) => EmailLogIn(camera: camera)),
                              );
                            },
                            child: Text('Login',
                                style: TextStyle(
<<<<<<< HEAD
                                  color: Color(0xff19456b),
=======
                                  color: Color(0xff11698E),
>>>>>>> 9b085bd3468e466b8f880489df733954990ddc89
                                  fontSize: 24,
                                )))))
              ]),
            )));

  }
}