import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Paleta paleta;
int indeksKoloru = 0;

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Future<Paleta> pobierzPalete() async {
  final odpowiedz = await http.post('http://colormind.io/api/', body: '{"model":"default"}');

  if (odpowiedz.statusCode == 200) {
    return Paleta.fromJson(json.decode(odpowiedz.body) as Map<String, dynamic>);
  } else {
    throw Exception('Nie udało się pobrać kolorów');
  }
}

class Paleta {
  final List<dynamic> paleta;

  Paleta({this.paleta});

  factory Paleta.fromJson(Map<String, dynamic> json) {
    return Paleta(
      paleta: json['result'] as List<dynamic>,
    );
  }

  List<Color> doListyRGB() {
    final lista = <Color>[];
    lista.add(Color.fromARGB(255, paleta[0][0] as int, paleta[0][1] as int, paleta[0][2] as int));
    lista.add(Color.fromARGB(255, paleta[1][0] as int, paleta[1][1] as int, paleta[1][2] as int));
    lista.add(Color.fromARGB(255, paleta[2][0] as int, paleta[2][1] as int, paleta[2][2] as int));
    lista.add(Color.fromARGB(255, paleta[3][0] as int, paleta[3][1] as int, paleta[3][2] as int));
    lista.add(Color.fromARGB(255, paleta[4][0] as int, paleta[4][1] as int, paleta[4][2] as int));
    return lista;
  }
}

List<Color> koloryPrzyciskow = [
  HexColor('11575B'),
  HexColor('80AE13'),
  HexColor('E6BE16'),
  HexColor('FE8A08'),
  HexColor('EB2E1B'),
];
