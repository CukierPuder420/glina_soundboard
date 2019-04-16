import 'package:flutter/material.dart';
import 'package:glina_soundboard/funkcje/odtworz_dzwiek.dart';
import 'package:shake/shake.dart';
import 'package:random_color/random_color.dart';

class EkranGlownyState extends StatefulWidget{
  @override
  _EkranGlownyState createState() => _EkranGlownyState();
}

class _EkranGlownyState extends State<EkranGlownyState> {

  Container kontener(int idDzwieku, var opis) {
    RandomColor _losowyKolor = RandomColor();
    Color _kolor = _losowyKolor.randomColor();
    return new Container(
      child: RaisedButton(
        onPressed: (){
          odtworzDzwiek(idDzwieku);
        },
        child: Text(opis),
        color: _kolor,
      ),
    );
  }

  ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        odtworzDzwiek(5);
      }
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            odtworzDzwiek(0);
          },
          label: const Text('MAJOR'),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text('Glina soundboard'),
              backgroundColor: Colors.green,
              expandedHeight: 400.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('zasoby/zdjecia/morze.jpg', fit: BoxFit.cover),
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 4,
              children: <Widget> [
                  kontener(1, 'AAAAA kurwa'),
                  kontener(2, 'lallouleciak napleciak'),
                  kontener(3, 'strasznie głupio'),
                  kontener(4, '*jęk*'),
                ],
            ),
          ],
        ),
    );
  }
}