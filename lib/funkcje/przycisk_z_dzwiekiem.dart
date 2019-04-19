import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:glina_soundboard/funkcje/odtworz_dzwiek.dart';
import 'package:auto_size_text/auto_size_text.dart';

Container przyciskZDzwiekiem(int idDzwieku, var opis) {
  RandomColor _losowyKolor = RandomColor();
  Color _kolor = _losowyKolor.randomColor(
      colorBrightness: ColorBrightness.veryLight
  );
  return new Container(
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
  );
}