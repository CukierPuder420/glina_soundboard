import 'package:flutter/material.dart';
import 'package:glina_soundboard/ekrany/ekran_glowny.dart';
import 'package:glina_soundboard/funkcje/dodaj_do_ulubionych.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:glina_soundboard/funkcje/kolory_przyciskow.dart';
import 'package:glina_soundboard/funkcje/dni.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

  /// KOLEJNOŚĆ AKCJI:
  ///  * ustalenie długości listy ulubionych
  ///  * odczytanie listy numerów ulubionych z shared_preferences, parsowanie na inty i wczytanie do RAMu
  ///  * odczytanie listy opisów ulubionych z shared_preferences i wczytanie do RAMu
  ///  * pobranie palety kolorów z sieci przez API colormind.io
  ///  * zastąpienie domyślnej (różowej) palety kolorami z colormind.io
  ///  * odczytanie ilości dni z shared_preferences i wczytanie do RAMu
  ///  * odczytanie daty ostatniego zapisu dni z shared_preferences, parsowanie i wczytanie do RAMu
  ///  * sprawdzenie, czy należy usunąć dni
  ///  * skok do EkranGlownyState()

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    iloscUlubionych().then((_dlugoscListy) {
      dlugoscListy = _dlugoscListy;
    }).then((dump) async {
      ulubioneInty = await odczytajListeInty();
    }).then((dump) async {
      ulubioneOpisy = await odczytajListeOpisy();
    }).then((dump) async {
      paleta = await pobierzPalete();
    }).then((dump) {
      koloryPrzyciskow = paleta.doListyRGB();
    }).then((dump) async {
      iloscDni = await odczytajDni();
    }).then((dump) async {
      wczoraj = await odczytajDate();
    }).then((dump) {
      usunDni();
    }).then((dump) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => EkranGlownyState()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'zasoby/zdjecia/siedzacy.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Center(
            child: Container(
              height: 80,
              margin: EdgeInsets.all(25),
              color: Colors.white70,
              alignment: Alignment(0, 0),
              child: AutoSizeText.rich(
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