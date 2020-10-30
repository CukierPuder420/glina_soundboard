import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ekrany/splashscreen.dart';

/// Czeka, aż orientacja ekranu zablokuje się w pionie i wyświetla GlinaSoundboard().
void main() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(GlinaSoundboard());
}

class GlinaSoundboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glina Soundboard',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: SplashScreen(),
    );
  }
}
