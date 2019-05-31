import 'package:flutter/material.dart';
import 'package:glina_soundboard/funkcje/odtworz_dzwiek.dart';
import 'package:shake/shake.dart';
import 'package:glina_soundboard/funkcje/przycisk_z_dzwiekiem.dart';
import 'package:glina_soundboard/ekrany/ulubione.dart';
import 'package:glina_soundboard/funkcje/dni.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:page_transition/page_transition.dart';

class EkranGlownyState extends StatefulWidget {
  @override
  _EkranGlownyState createState() => _EkranGlownyState();
}

class _EkranGlownyState extends State<EkranGlownyState> {
  ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
    arrr();
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          major();
        },
        label: Text('MAJOR'),
      ),
      body: Builder(
        builder: (context) => CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  title: Text('Glina soundboard'),
                  backgroundColor: Colors.green,
                  expandedHeight: 400.0,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset('zasoby/zdjecia/morze.jpg',
                        fit: BoxFit.cover),
                  ),
                  actions: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            '$iloscDni',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          ),
                          Icon(
                            MdiIcons.fire,
                            color: Colors.deepOrange,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: Ulubione(),
                                type: PageTransitionType.upToDown,
                                duration: Duration(milliseconds: 300)));
                      },
                    ),
                  ],
                ),
                SliverGrid.count(
                  crossAxisCount: 4,
                  children: <Widget>[
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
                    przyciskZDzwiekiem(16, 'tak jest', context),
                    przyciskZDzwiekiem(17, 'here we go', context),
                    przyciskZDzwiekiem(18, 'soczysta buła', context),
                    przyciskZDzwiekiem(19, 'pierwsza runda', context),
                    przyciskZDzwiekiem(20, 'ale dostałem bułę', context),
                    przyciskZDzwiekiem(21, 'karniak w stópkę <3', context),
                    przyciskZDzwiekiem(22, 'głupio, agresywnie', context),
                    przyciskZDzwiekiem(23, 'ale zepsułem', context),
                    przyciskZDzwiekiem(24, 'big time frags', context),
                    przyciskZDzwiekiem(25, 'danke', context),
                    przyciskZDzwiekiem(26, 'dmg', context),
                    przyciskZDzwiekiem(27, 'raszing', context),
                    przyciskZDzwiekiem(28, 'jak dzik w żołędzie', context),
                    przyciskZDzwiekiem(29, 'parostatek', context),
                    przyciskZDzwiekiem(30, 'fak ju no', context),
                    przyciskZDzwiekiem(31, 'orgazm', context),
                  ],
                ),
              ],
            ),
      ),
    );
  }
}
