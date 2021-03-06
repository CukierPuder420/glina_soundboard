import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'dni.dart';
import 'dodaj_do_ulubionych.dart';
import 'kolory_przyciskow.dart';
import 'odtworz_dzwiek.dart';

///min: 0, max: 255
const _progLuminacji = 128;

class PrzyciskZDzwiekiem extends StatefulWidget {
  PrzyciskZDzwiekiem(this.idDzwieku, this.opis);
  final int idDzwieku;
  final String opis;
  _PrzyciskZDzwiekiemState createState() => _PrzyciskZDzwiekiemState(idDzwieku, opis);
}

class _PrzyciskZDzwiekiemState extends State<PrzyciskZDzwiekiem> with AutomaticKeepAliveClientMixin<PrzyciskZDzwiekiem> {
  final int idDzwieku;
  final String opis;
  _PrzyciskZDzwiekiemState(this.idDzwieku, this.opis);
  Color _kolor;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    if (indeksKoloru + 1 == koloryPrzyciskow.length) {
      indeksKoloru = 0;
    } else {
      indeksKoloru++;
    }
    _kolor = koloryPrzyciskow[indeksKoloru];
  }

  bool _czyCiemny(Color kolor) {
    var string = kolor.toString();

    ///Color(0xffffffff) do ffffff
    string = string.substring(10, 16);
    final r = int.parse(string.substring(0, 2), radix: 16);
    final g = int.parse(string.substring(2, 4), radix: 16);
    final b = int.parse(string.substring(4, 6), radix: 16);
    final luminacja = 0.2126 * r + 0.7152 * g + 0.0722 * b;
    if (luminacja < _progLuminacji) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onLongPress: () {
        dodajDoUlubionych(idDzwieku, opis);
        final snackBar = const SnackBar(
          content: Text('Dodano do ulubionych ❤'),
          duration: Duration(seconds: 2),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: RaisedButton(
        onPressed: () {
          odtworzDzwiek(idDzwieku);
          zmienDni();
        },
        child: AutoSizeText(
          opis,
          softWrap: true,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: TextStyle(
            fontSize: 12,
            color: _czyCiemny(_kolor) ? Colors.white : Colors.black,
          ),
          minFontSize: 6,
          overflow: TextOverflow.ellipsis,
        ),
        color: _kolor,
      ),
    );
  }
}
