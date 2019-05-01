import 'package:flutter/material.dart';
import 'dart:async';
import 'package:glina_soundboard/ekrany/ekran_glowny.dart';
import 'package:glina_soundboard/funkcje/dodaj_do_ulubionych.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:glina_soundboard/funkcje/kolory_przyciskow.dart';
import 'package:glina_soundboard/funkcje/dni.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    iloscUlubionych().then((_dlugoscListy) {
      dlugoscListy = _dlugoscListy;
    }).then((_dlugoscListy) async {
      ulubioneInty = await odczytajListeInty();
    }).then((_dlugoscListy) async {
      ulubioneOpisy = await odczytajListeOpisy();
    }).then((_dlugoscListy) async {
      paleta = await pobierzPalete();
    }).then((_paleta) {
      koloryPrzyciskow = paleta.doListyRGB();
    }).then((_dlugoscListy) async {
      iloscDni = await odczytajDni();
    }).then((_dlugoscListy) async {
      wczoraj = await odczytajDate();
    }).then((_dlugoscListy) {
      usunDni();
    }).then((_dlugoscListy) {
      Timer(Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => EkranGlownyState()),
        );
      });
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
