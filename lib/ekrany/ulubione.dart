import 'package:flutter/material.dart';
import 'package:glina_soundboard/funkcje/dodajDoUlubionych.dart';
import 'package:glina_soundboard/funkcje/odtworz_dzwiek.dart';

class Ulubione extends StatefulWidget {
  @override
  _UlubioneState createState() => _UlubioneState();
}

class _UlubioneState extends State<Ulubione> {
/*  int dlugoscListy;
  List<int> ulubioneInty;
  List<String> ulubioneOpisy;

  @override
  void initState() {
    super.initState();
    iloscUlubionych().then((_dlugoscListy){
      dlugoscListy = _dlugoscListy;
    });
    odczytajListeInty().then((_ulubioneInty){
      ulubioneInty = _ulubioneInty;
    });
    odczytajListeOpisy().then((_ulubioneOpisy){
      ulubioneOpisy = _ulubioneOpisy;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ulubione'),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
          Navigator.pop(context);
        }),
      ),
      body: ListView.builder(
        itemCount: dlugoscListy,
        itemBuilder: (context, index) {
          final numer = ulubioneInty[index];
          final opis = ulubioneOpisy[index];
          return ListTile(
            title: Text(opis),
            leading: Icon(Icons.play_arrow),
            onTap: (){
              odtworzDzwiek(numer);
            },
          );
        },
      ),
    );
  }
}