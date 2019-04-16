import 'package:flutter/material.dart';
import 'dart:async';
import 'package:glina_soundboard/ekrany/ekran_glowny.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    new Timer(
        Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(
            builder: (BuildContext context) => EkranGlownyState()
        ),
      );
    }
    );

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Image.asset(
            'zasoby/zdjecia/siedzacy.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          new Center(
            child: Container(
              height: 80,
              margin: EdgeInsets.all(25),
              color: Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: 'Glina Soundboard',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(Icons.directions_run),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
