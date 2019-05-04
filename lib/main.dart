import 'package:flutter/material.dart';
import 'package:glina_soundboard/ekrany/splashscreen.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(GlinaSoundboard());
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