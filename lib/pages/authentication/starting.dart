import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gymico/pages/authentication/signUp.dart';
import 'login.dart';

class Starting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              child: Image(
                image: AssetImage('assets/images/gym3.jpg'),
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              ),
            ),
            Positioned.fill(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                color: Colors.transparent,
              ),
            )),
            Container(
              padding: EdgeInsets.all(70),
              alignment: Alignment.topCenter,
              child: Text("WELCOME TO GYMICO",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6), fontWeight: FontWeight.bold, fontSize: 50.0)),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 120.0),
              child: FlatButton(
                padding: EdgeInsets.fromLTRB(130, 15, 130, 15),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
                color: Colors.black54,
                textColor: Colors.black45,
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white54.withOpacity(0.6),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 50.0),
              child: FlatButton(
                padding: EdgeInsets.fromLTRB(120, 15, 120, 15),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
                color: Colors.black54,
                textColor: Colors.black45,
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white54.withOpacity(0.6),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
