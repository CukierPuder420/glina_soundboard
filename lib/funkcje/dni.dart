import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

const String kluczDni = 'glinasoundboard_dni';
const String kluczWczoraj = 'glinasoundboard_wczoraj';

int iloscDni = 0;
DateTime wczoraj;

void zapiszDate(DateTime czas) async {
  final sp = await SharedPreferences.getInstance();
  final bufor = czas.toIso8601String();
  sp.setString(kluczWczoraj, bufor);
}

Future<DateTime> odczytajDate() async {
  final sp = await SharedPreferences.getInstance();
  if (sp.containsKey(kluczWczoraj)) {
    final bufor = sp.getString(kluczWczoraj);
    final data = DateTime.parse(bufor);
    return data;
  } else {
    final data = DateTime.now();
    zapiszDate(data);
    return data;
  }
}

void zapiszDni(final int dni) async {
  final sp = await SharedPreferences.getInstance();
  sp.setInt(kluczDni, dni);
}

Future<int> odczytajDni() async {
  final sp = await SharedPreferences.getInstance();
  if (sp.containsKey(kluczDni)) {
    final bufor = sp.getInt(kluczDni);
    return bufor;
  } else {
    sp.setInt(kluczDni, 0);
    return 0;
  }
}

void usunDni() async {
  if (DateTime.now().isAfter(wczoraj.add(const Duration(days: 1, hours: 23)))) {
    iloscDni = 0;
    zapiszDni(iloscDni);
    wczoraj = DateTime.now();
    zapiszDate(wczoraj);
  }
}

void zmienDni() async {
  if ((DateTime.now().isBefore(wczoraj.add(const Duration(days: 1, hours: 23)))) && (DateTime.now().isAfter(wczoraj.add(const Duration(hours: 23))))) {
    iloscDni = await odczytajDni();
    iloscDni++;
    zapiszDni(iloscDni);
    wczoraj = DateTime.now();
    zapiszDate(wczoraj);
  } else {
    usunDni();
  }
}
