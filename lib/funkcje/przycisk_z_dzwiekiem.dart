import 'package:flutter/material.dart';
import 'package:glina_soundboard/funkcje/odtworz_dzwiek.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:glina_soundboard/funkcje/dodaj_do_ulubionych.dart';
import 'package:glina_soundboard/funkcje/kolory_przyciskow.dart';
import 'package:glina_soundboard/funkcje/dni.dart';

GestureDetector przyciskZDzwiekiem(int idDzwieku, var opis, BuildContext context) {
	if(indeksKoloru + 1 == koloryPrzyciskow.length) {
		indeksKoloru = 0;
	} else {
		indeksKoloru++;
	}
	Color _kolor = koloryPrzyciskow[indeksKoloru];
	return new GestureDetector(
		onLongPress: (){
      czyGotowe = false;
			dodajDoUlubionych(idDzwieku, opis).then((_prawda){
        czyGotowe = _prawda;
      });
			final snackBar = SnackBar(
				content: Text('Dodano do ulubionych ❤'),
				duration: Duration(seconds: 2),
			);
			Scaffold.of(context).showSnackBar(snackBar);
		},
		child: Container(
			child: RaisedButton(
				onPressed: (){
					odtworzDzwiek(idDzwieku);
					zmienDni();
				},
				child: AutoSizeText(
					opis,
					softWrap: true,
					textAlign: TextAlign.center,
					maxLines: 2,
					style: TextStyle(fontSize: 13),
					minFontSize: 6,
					overflow: TextOverflow.ellipsis,
				),
				color: _kolor,
			),
		),
	);
}