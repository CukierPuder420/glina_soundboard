import 'package:flutter/material.dart';
import 'package:glina_soundboard/ekrany/splashscreen.dart';

void main() => runApp(GlinaSoundboard());

class GlinaSoundboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glina soundboard',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: SplashScreen(),
    );
  }
}