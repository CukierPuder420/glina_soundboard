import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';

const String kluczNumery = 'glinasoundboard_ulubione_numery';
const String kluczOpisy = 'glinasoundboard_ulubione_opisy';
List<int> ulubioneInty = List();
List<String> ulubioneOpisy = List();
int dlugoscListy;

void zapiszListe(
    List<String> ulubioneNumery, List<String> ulubioneOpisy) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.setStringList(kluczNumery, ulubioneNumery);
  sp.setStringList(kluczOpisy, ulubioneOpisy);
}

void usunListy() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.remove(kluczNumery);
  sp.remove(kluczOpisy);
}

Future<List<String>> odczytajListeNumery() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  if (!sp.containsKey(kluczNumery)) {
    List<String> bufor = List();
    sp.setStringList(kluczNumery, bufor);
  }
  return sp.getStringList(kluczNumery);
}

Future<List<String>> odczytajListeOpisy() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  if (!sp.containsKey(kluczOpisy)) {
    List<String> bufor = List();
    sp.setStringList(kluczOpisy, bufor);
  }
  return sp.getStringList(kluczOpisy);
}

Future<List<int>> odczytajListeInty() async {
  List<String> stringi = await odczytajListeNumery();
  List<int> inty = List();
  for (int i = 0; i < stringi.length; i++) {
    inty.add(int.parse(stringi[i]));
  }
  return inty;
}

List<String> intyNaStringi(List<int> inty) {
  List<String> stringi = List();
  for(int i in inty) {
    stringi.add(i.toString());
  }
  return stringi;
}

int iloscUlubionych() => ulubioneInty.length;

void dodajDoUlubionych(int idDzwieku, String opisDzwieku) async {
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

void usunZUlubionych(int idDzwieku, String opisDzwieku) async {
  ulubioneInty.remove(idDzwieku);
  ulubioneOpisy.remove(opisDzwieku);
  dlugoscListy = iloscUlubionych();
  zapiszListe(intyNaStringi(ulubioneInty), ulubioneOpisy);
}