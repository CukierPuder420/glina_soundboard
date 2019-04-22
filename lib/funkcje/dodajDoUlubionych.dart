import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';

final String kluczNumery = 'glinasoundboard_ulubione_numery';
final String kluczOpisy = 'glinasoundboard_ulubione_opisy';
List<int> ulubioneInty = List();
List<String> ulubioneOpisy = List();
int dlugoscListy;

void zapiszListe(List<String> ulubioneNumery, List<String> ulubioneOpisy) async {
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
  if(!sp.containsKey(kluczNumery)) {
    List<String> bufor = List();
    sp.setStringList(kluczNumery, bufor);
  }
  return sp.getStringList(kluczNumery);
}

Future<List<String>> odczytajListeOpisy() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  if(!sp.containsKey(kluczOpisy)) {
    List<String> bufor = List();
    sp.setStringList(kluczOpisy, bufor);
  }
  return sp.getStringList(kluczOpisy);
}

Future<List<int>> odczytajListeInty() async {
  List<String> stringi = await odczytajListeNumery();
  List<int> inty = List();
  for(int i = 0; i < stringi.length; i++) {
    inty.add(int.parse(stringi[i]));
  }
  return inty;
}

Future<int> iloscUlubionych() async {
  var inty = await odczytajListeInty();
  return inty.length;
}

void dodajDoUlubionych(int idDzwieku, String opisDzwieku) async {
  List<String> ulubioneNumery = await odczytajListeNumery();
  List<String> ulubioneOpisy = await odczytajListeOpisy();
  ulubioneNumery.add('$idDzwieku');
  ulubioneOpisy.add(opisDzwieku);

  var bufor = ulubioneNumery.toSet();
  ulubioneNumery = bufor.toList();
  bufor = ulubioneOpisy.toSet();
  ulubioneOpisy = bufor.toList();

  zapiszListe(ulubioneNumery, ulubioneOpisy);
  print(await odczytajListeInty());
  print(await odczytajListeOpisy());

  ulubioneInty = await odczytajListeInty();
  ulubioneOpisy = await odczytajListeOpisy();
  dlugoscListy = await iloscUlubionych();
}