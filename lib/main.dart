import 'package:flutter/material.dart';
import 'package:glina_soundboard/ekrany/splashscreen.dart';
import 'package:flutter/services.dart';

/// czeka, aż orientacja ekranu zablokuje się w pionie i wyświetla GlinaSoundboard()
void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(GlinaSoundboard());
  });
}

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
