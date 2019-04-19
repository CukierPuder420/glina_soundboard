import 'package:flutter/material.dart';
import 'package:glina_soundboard/funkcje/odtworz_dzwiek.dart';
import 'package:shake/shake.dart';
import 'package:glina_soundboard/funkcje/przycisk_z_dzwiekiem.dart';

class EkranGlownyState extends StatefulWidget{
  @override
  _EkranGlownyState createState() => _EkranGlownyState();
}

class _EkranGlownyState extends State<EkranGlownyState> {

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
        label: Text('MAJOR'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Glina soundboard'),
            backgroundColor: Colors.green,
            expandedHeight: 400.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('zasoby/zdjecia/morze.jpg', fit: BoxFit.cover),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 4,
            children: <Widget> [
              przyciskZDzwiekiem(1, 'AAAAA kurwa'),
              przyciskZDzwiekiem(2, 'lalloueciak napleciak'),
              przyciskZDzwiekiem(3, 'strasznie głupio'),
              przyciskZDzwiekiem(4, '*jęk*'),
              przyciskZDzwiekiem(6, 'AHH jest'),
              przyciskZDzwiekiem(7, 'jebaniutki'),
              przyciskZDzwiekiem(8, 'wooolny jestem'),
              przyciskZDzwiekiem(9, 'AAA szkoda'),
              przyciskZDzwiekiem(10, 'ajj nieprzyjemnie'),
              przyciskZDzwiekiem(11, 'FAMAS'),
              przyciskZDzwiekiem(12, 'FAMAS 2'),
              przyciskZDzwiekiem(13, 'niee'),
              przyciskZDzwiekiem(14, 'nie bawię się'),
              przyciskZDzwiekiem(15, 'kormoran'),
            ],
          ),
        ],
      ),
    );
  }
}