import 'package:flutter/material.dart';
import 'dart:async';
import 'package:glina_soundboard/ekrany/ekran_glowny.dart';
import 'package:glina_soundboard/funkcje/dodaj_do_ulubionych.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:glina_soundboard/funkcje/kolory_przyciskow.dart';

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
      print(paleta.paleta);
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(
            builder: (BuildContext context) => EkranGlownyState()
        ),
      );
    }
    );
    iloscUlubionych().then((_dlugoscListy){
      dlugoscListy = _dlugoscListy;
    });
    odczytajListeInty().then((_ulubioneInty){
      ulubioneInty = _ulubioneInty;
    });
    odczytajListeOpisy().then((_ulubioneOpisy){
      ulubioneOpisy = _ulubioneOpisy;
    });
    pobierzPalete().then((_paleta){
      paleta = _paleta;
    }).then((_paleta){
      koloryPrzyciskow = paleta.doListyRGB();
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: AutoSizeText.rich(
                      TextSpan(text: 'Glina Soundboard'),
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      minFontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
