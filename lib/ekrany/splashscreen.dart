import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../funkcje/dni.dart';
import '../funkcje/dodaj_do_ulubionych.dart';
import '../funkcje/kolory_przyciskow.dart';
import 'ekran_glowny.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

/// KOLEJNOŚĆ AKCJI:
///  * odczytanie listy numerów ulubionych z shared_preferences, parsowanie na inty i wczytanie do RAMu
///  * odczytanie listy opisów ulubionych z shared_preferences i wczytanie do RAMu
///  * pobranie palety kolorów z sieci przez API colormind.io (timeout - 2 sekundy)
///  * zastąpienie domyślnej (różowej) palety kolorami z colormind.io
///  * odczytanie ilości dni z shared_preferences i wczytanie do RAMu
///  * odczytanie daty ostatniego zapisu dni z shared_preferences, parsowanie i wczytanie do RAMu
///  * sprawdzenie, czy należy usunąć dni
///  * ustalenie długości listy ulubionych
///  * skok do EkranGlownyState()

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    odczytajListeInty()
        .then((_inty) {
          ulubioneInty = _inty;
        })
        .then((_) async {
          ulubioneOpisy = await odczytajListeOpisy();
        })
        .then((_) async {
          paleta = await pobierzPalete();
        })
        .timeout(const Duration(seconds: 2))
        .catchError(print)
        .then((_) {
          koloryPrzyciskow = paleta.doListyRGB();
        })
        .catchError(print)
        .then((_) async {
          iloscDni = await odczytajDni();
        })
        .then((_) async {
          wczoraj = await odczytajDate();
        })
        .then((_) {
          usunDni();
        })
        .then((_) {
          dlugoscListy = iloscUlubionych();
        })
        .then((_) {
          Navigator.pushReplacement(
              context, PageTransition<Widget>(type: PageTransitionType.bottomToTop, child: EkranGlownyState(), duration: const Duration(milliseconds: 500)));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/zdjecia/siedzacy.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Center(
            child: Container(
              height: 80,
              margin: const EdgeInsets.all(25),
              color: Colors.white70,
              alignment: const Alignment(0, 0),
              child: const AutoSizeText.rich(
                TextSpan(text: 'Glina Soundboard'),
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                minFontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
