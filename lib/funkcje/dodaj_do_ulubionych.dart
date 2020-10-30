import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';

const String kluczNumery = 'glinasoundboard_ulubione_numery';
const String kluczOpisy = 'glinasoundboard_ulubione_opisy';
var ulubioneInty = <int>[];
var ulubioneOpisy = <String>[];
int dlugoscListy;

void zapiszListe(final List<String> ulubioneNumery, final List<String> ulubioneOpisy) async {
  final sp = await SharedPreferences.getInstance();
  sp.setStringList(kluczNumery, ulubioneNumery);
  sp.setStringList(kluczOpisy, ulubioneOpisy);
}

void usunListy() async {
  final sp = await SharedPreferences.getInstance();
  sp.remove(kluczNumery);
  sp.remove(kluczOpisy);
}

Future<List<String>> odczytajListeNumery() async {
  final sp = await SharedPreferences.getInstance();
  if (!sp.containsKey(kluczNumery)) {
    sp.setStringList(kluczNumery, <String>[]);
  }
  return sp.getStringList(kluczNumery);
}

Future<List<String>> odczytajListeOpisy() async {
  final sp = await SharedPreferences.getInstance();
  if (!sp.containsKey(kluczOpisy)) {
    sp.setStringList(kluczOpisy, <String>[]);
  }
  return sp.getStringList(kluczOpisy);
}

Future<List<int>> odczytajListeInty() async {
  final stringi = await odczytajListeNumery();
  final inty = <int>[];
  for (final i in stringi) {
    inty.add(int.parse(i));
  }
  return inty;
}

List<String> intyNaStringi(final List<int> inty) {
  final stringi = <String>[];
  for (final i in inty) {
    stringi.add(i.toString());
  }
  return stringi;
}

int iloscUlubionych() => ulubioneInty.length;

void dodajDoUlubionych(final int idDzwieku, final String opisDzwieku) async {
  ulubioneInty.add(idDzwieku);
  ulubioneOpisy.add(opisDzwieku);
  dlugoscListy = iloscUlubionych();

  /// usuwanie duplikatów
  var bufor1 = ulubioneInty.toSet();
  ulubioneInty = bufor1.toList();
  var bufor2 = ulubioneOpisy.toSet();
  ulubioneOpisy = bufor2.toList();

  zapiszListe(intyNaStringi(ulubioneInty), ulubioneOpisy);
}

void usunZUlubionych(final int idDzwieku, final String opisDzwieku) async {
  ulubioneInty.remove(idDzwieku);
  ulubioneOpisy.remove(opisDzwieku);
  dlugoscListy = iloscUlubionych();
  zapiszListe(intyNaStringi(ulubioneInty), ulubioneOpisy);
}
