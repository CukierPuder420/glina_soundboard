import 'package:flutter/material.dart';
import 'package:glina_soundboard/funkcje/odtworz_dzwiek.dart';
import 'package:shake/shake.dart';
import 'package:glina_soundboard/funkcje/przycisk_z_dzwiekiem.dart';

class EkranGlownyState extends StatefulWidget{
  @override
  _EkranGlownyState createState() => _EkranGlownyState();
}

class _EkranGlownyState extends State<EkranGlownyState> {

  ShakeDetector detector = new ShakeDetector.autoStart(
      onPhoneShake: () {
        odtworzDzwiek(5);
      }
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: new FloatingActionButton.extended(
        onPressed: (){
          odtworzDzwiek(0);
        },
        label: new Text('MAJOR'),
      ),
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            title: new Text('Glina soundboard'),
            backgroundColor: Colors.green,
            expandedHeight: 400.0,
            floating: true,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              background: new Image.asset('zasoby/zdjecia/morze.jpg', fit: BoxFit.cover),
            ),
          ),
          new SliverGrid.count(
            crossAxisCount: 4,
            children: <Widget> [
              przyciskZDzwiekiem(1, 'AAAAA kurwa'),
              przyciskZDzwiekiem(2, 'lallouleciak napleciak'),
              przyciskZDzwiekiem(3, 'strasznie głupio'),
              przyciskZDzwiekiem(4, '*jęk*'),
            ],
          ),
        ],
      ),
    );
  }
}