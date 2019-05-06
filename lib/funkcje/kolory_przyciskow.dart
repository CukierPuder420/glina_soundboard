import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Paleta paleta;
int indeksKoloru = 0;

class HexColor extends Color {
	static int _getColorFromHex(String hexColor) {
		hexColor = hexColor.toUpperCase().replaceAll("#", "");
		if (hexColor.length == 6) {
			hexColor = "FF" + hexColor;
		}
		return int.parse(hexColor, radix: 16);
	}

	HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Future<Paleta> pobierzPalete() async {
	final odpowiedz = await http.post('http://colormind.io/api/', body: '{"model":"default"}');

	if (odpowiedz.statusCode == 200) {
		return Paleta.fromJson(json.decode(odpowiedz.body));
	} else {
		throw Exception('Nie udało się pobrać kolorów');
	}
}

class Paleta {
	final List<dynamic> paleta;

	Paleta({this.paleta});

	factory Paleta.fromJson(Map<String, dynamic> json) {
		return Paleta(
			paleta: json['result'],
		);
	}

  bool _czyCiemny(Color kolor) {
  String string = kolor.toString();
  string = string.substring(10, 16); //Color(0x12345678) do 012345
  final int r = int.parse(string.substring(0, 2), radix: 16);
  final int g = int.parse(string.substring(2, 4), radix: 16);
  final int b = int.parse(string.substring(4, 6), radix: 16);
  final double luminacja = 0.2126 * r + 0.7152 * g + 0.0722 * b;
  if(luminacja < 80) {
    return true;
  } else {
    return false;
  }
}

	List<Color> doListyRGB() {
		List<Color> lista = List();
		lista.add(Color.fromARGB(255, paleta[0][0], paleta[0][1], paleta[0][2]));
		lista.add(Color.fromARGB(255, paleta[1][0], paleta[1][1], paleta[1][2]));
		lista.add(Color.fromARGB(255, paleta[2][0], paleta[2][1], paleta[2][2]));
		lista.add(Color.fromARGB(255, paleta[3][0], paleta[3][1], paleta[3][2]));
		lista.add(Color.fromARGB(255, paleta[4][0], paleta[4][1], paleta[4][2]));
		return lista;
	}

  List<bool> jasnoscKolorow() {
    List<bool> jasnosci = List();
    for(Color i in koloryPrzyciskow) {
      jasnosci.add(_czyCiemny(i));
    }
  }
}

List<Color> koloryPrzyciskow = [
	HexColor('ff3377'),
	HexColor('ff5588'),
	HexColor('ff77aa'),
	HexColor('ff99cc'),
	HexColor('ffbbee'),
];