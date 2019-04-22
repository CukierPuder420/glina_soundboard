import 'package:flutter/material.dart';
import 'package:glina_soundboard/funkcje/odtworz_dzwiek.dart';
import 'package:shake/shake.dart';
import 'package:glina_soundboard/funkcje/przycisk_z_dzwiekiem.dart';
import 'package:glina_soundboard/ekrany/ulubione.dart';

class EkranGlownyState extends StatefulWidget{
  @override
  _EkranGlownyState createState() => _EkranGlownyState();
}

class _EkranGlownyState extends State<EkranGlownyState> {

  ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        arrr();
      }
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          major();
        },
        label: Text('MAJOR'),
      ),
      body: Builder(
        builder: (context) =>
            CustomScrollView(
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
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.star),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Ulubione()),
                        );
                      },
                    )
                  ],
                ),
                SliverGrid.count(
                  crossAxisCount: 4,
                  children: <Widget> [
                    przyciskZDzwiekiem(1, 'AAAAA kurwa', context),
                    przyciskZDzwiekiem(2, 'lalloueciak napleciak', context),
                    przyciskZDzwiekiem(3, 'strasznie głupio', context),
                    przyciskZDzwiekiem(4, '*jęk*', context),
                    przyciskZDzwiekiem(6, 'AHH jest', context),
                    przyciskZDzwiekiem(7, 'jebaniutki', context),
                    przyciskZDzwiekiem(8, 'wooolny jestem', context),
                    przyciskZDzwiekiem(9, 'AAA szkoda', context),
                    przyciskZDzwiekiem(10, 'ajj nieprzyjemnie', context),
                    przyciskZDzwiekiem(11, 'FAMAS', context),
                    przyciskZDzwiekiem(12, 'FAMAS 2', context),
                    przyciskZDzwiekiem(13, 'niee', context),
                    przyciskZDzwiekiem(14, 'nie bawię się', context),
                    przyciskZDzwiekiem(15, 'kormoran', context),
                  ],
                ),
              ],
            ),
      ),
    );
  }
}