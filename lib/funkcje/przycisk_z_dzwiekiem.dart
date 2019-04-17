import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:glina_soundboard/funkcje/odtworz_dzwiek.dart';

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
      child: Text(
          opis,
          textAlign: TextAlign.center,
      ),
      color: _kolor,
    ),
  );
}