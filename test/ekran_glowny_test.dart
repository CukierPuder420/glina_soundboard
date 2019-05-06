import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glina_soundboard/ekrany/splashscreen.dart';

void main() {

  Widget _SplashScreen() {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
  testWidgets('SplashScreen ma tytuł', (WidgetTester tester) async {
    await tester.pumpWidget(_SplashScreen());

    final tytul = find.text('Glina Soundboard');

    expect(tytul, findsOneWidget);
  });
}