import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

const String kluczNumery = 'glinasoundboard_ulubione_numery';
const String kluczOpisy = 'glinasoundboard_ulubione_opisy';
List<int> ulubioneInty = List();
List<String> ulubioneOpisy = List();
int dlugoscListy;
bool czyGotowe = true;

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

Future<int> iloscUlubionych() async {
  var inty = await odczytajListeNumery();
  return inty.length;
}

Future<bool> dodajDoUlubionych(int idDzwieku, String opisDzwieku) async {
  czyGotowe = false;
  List<String> ulubioneNumery = await odczytajListeNumery();
  List<String> ulubioneOpisy = await odczytajListeOpisy();
  ulubioneNumery.add('$idDzwieku');
  ulubioneOpisy.add(opisDzwieku);

  var bufor = ulubioneNumery.toSet();
  ulubioneNumery = bufor.toList();
  bufor = ulubioneOpisy.toSet();
  ulubioneOpisy = bufor.toList();

  zapiszListe(ulubioneNumery, ulubioneOpisy);

  if (!kReleaseMode) {
    print('Lista indeksów ulubionnych: ${await odczytajListeInty()}');
    print('Lista opisów ulubionych: ${await odczytajListeOpisy()}');
  }

  ulubioneInty = await odczytajListeInty();
  dlugoscListy = await iloscUlubionych();

  odczytajListeInty().then((lista) {
    ulubioneInty = lista;
  }).then((_) async {
    dlugoscListy = await iloscUlubionych();
  }).then((_){
    czyGotowe = true;
  });
  
  return true;
}

void usunZUlubionych(int idDzwieku, String opisDzwieku) async {
  var numery = await odczytajListeNumery();
  var opisy = await odczytajListeOpisy();
  numery.remove('$idDzwieku');
  opisy.remove(opisDzwieku);
  zapiszListe(numery, opisy);
  ulubioneInty = await odczytajListeInty();
  ulubioneOpisy = await odczytajListeOpisy();
  dlugoscListy = await iloscUlubionych();
}
