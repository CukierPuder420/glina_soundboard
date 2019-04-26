import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Paleta> pobierzPalete() async {
  final odpowiedz = await http.post('http://colormind.io/api/', body: '{"model":"default"}');

  if (odpowiedz.statusCode == 200) {
    return Paleta.fromJson(json.decode(odpowiedz.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class Paleta {
  final List<String> paleta;

  Paleta({this.paleta});

  factory Paleta.fromJson(Map<String, dynamic> json) {
    return Paleta(
      paleta: json['result'],
    );
  }
}