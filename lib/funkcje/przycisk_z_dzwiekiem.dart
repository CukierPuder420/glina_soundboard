import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:glina_soundboard/funkcje/odtworz_dzwiek.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:glina_soundboard/funkcje/dodajDoUlubionych.dart';

GestureDetector przyciskZDzwiekiem(int idDzwieku, var opis, BuildContext context) {
  RandomColor _losowyKolor = RandomColor();
  Color _kolor = _losowyKolor.randomColor(
      colorBrightness: ColorBrightness.veryLight
  );
  return new GestureDetector(
    onLongPress: (){
      dodajDoUlubionych(idDzwieku, opis);
      final snackBar = SnackBar(
        content: Text('Dodano do ulubionych ❤️'),
        duration: Duration(seconds: 2),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    },
    child: Container(
      child: RaisedButton(
        onPressed: (){
          odtworzDzwiek(idDzwieku);
        },
        child: AutoSizeText(
          opis,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: TextStyle(fontSize: 15),
          minFontSize: 10,
          overflow: TextOverflow.ellipsis,
        ),
        color: _kolor,
      ),
    ),
  );
}