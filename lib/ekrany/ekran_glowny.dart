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
                  backgroundColor: Colors.greenAccent,
                  expandedHeight: 300,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset('assets/zdjecia/morze.jpg',
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
                                duration: Duration(milliseconds: 150)));
                      },
                    ),
                  ],
                ),
                SliverGrid.count(
                  crossAxisCount: 4,
                  children: <Widget> [
                    PrzyciskZDzwiekiem(1, 'AAAAA kurwa'),
                    PrzyciskZDzwiekiem(2, 'lalloueciak napleciak'),
                    PrzyciskZDzwiekiem(3, 'strasznie głupio'),
                    PrzyciskZDzwiekiem(4, '*jęk*'),
                    PrzyciskZDzwiekiem(6, 'AHH jest'),
                    PrzyciskZDzwiekiem(7, 'jebaniutki'),
                    PrzyciskZDzwiekiem(8, 'wooolny jestem'),
                    PrzyciskZDzwiekiem(9, 'AAA szkoda'),
                    PrzyciskZDzwiekiem(10, 'ajj nieprzyjemnie'),
                    PrzyciskZDzwiekiem(11, 'FAMAS'),
                    PrzyciskZDzwiekiem(12, 'FAMAS 2'),
                    PrzyciskZDzwiekiem(13, 'niee'),
                    PrzyciskZDzwiekiem(14, 'nie bawię się'),
                    PrzyciskZDzwiekiem(15, 'kormoran'),
                    PrzyciskZDzwiekiem(16, 'tak jest'),
                    PrzyciskZDzwiekiem(17, 'here we go'),
                    PrzyciskZDzwiekiem(18, 'soczysta buła'),
                    PrzyciskZDzwiekiem(19, 'pierwsza runda'),
                    PrzyciskZDzwiekiem(20, 'ale dostałem bułę'),
                    PrzyciskZDzwiekiem(21, 'karniak w stópkę <3'),
                    PrzyciskZDzwiekiem(22, 'głupio, agresywnie'),
                    PrzyciskZDzwiekiem(23, 'ale zepsułem'),
                    PrzyciskZDzwiekiem(24, 'big time frags'),
                    PrzyciskZDzwiekiem(25, 'danke'),
                    PrzyciskZDzwiekiem(26, 'dmg'),
                    PrzyciskZDzwiekiem(27, 'raszing'),
                    PrzyciskZDzwiekiem(28, 'jak dzik w żołędzie'),
                    PrzyciskZDzwiekiem(29, 'parostatek 1'),
                    PrzyciskZDzwiekiem(30, 'fak ju no'),
                    PrzyciskZDzwiekiem(31, 'orgazm'),
                    PrzyciskZDzwiekiem(32, 'spokojnie'),
                    PrzyciskZDzwiekiem(33, 'aż się spociłem'),
                    PrzyciskZDzwiekiem(34, 'parostatek 2'),
                    PrzyciskZDzwiekiem(35, 'nie tuptaj'),
                    PrzyciskZDzwiekiem(36, 'popuś graj'),
                    PrzyciskZDzwiekiem(37, 'patrzcie ziemniora'),
                    PrzyciskZDzwiekiem(38, 'pestkownia'),
                    PrzyciskZDzwiekiem(39, 'tuptuptup'),
                    PrzyciskZDzwiekiem(40, 'groszek ty cwelu'),
                    PrzyciskZDzwiekiem(41, 'ale kichnę'),
                    PrzyciskZDzwiekiem(42, 'tylko gęsiego'),
                    PrzyciskZDzwiekiem(43, 'gdzie jest'),
                    PrzyciskZDzwiekiem(44, 'nowotwór'),
                    PrzyciskZDzwiekiem(45, 'mać'),
                    PrzyciskZDzwiekiem(47, 'BOT Ulryk'),
                    PrzyciskZDzwiekiem(48, '500-'),
                    PrzyciskZDzwiekiem(49, 'jak zwykle'),
                    PrzyciskZDzwiekiem(50, 'powstanie styczniowe'),
                  ],
                ),
              ],
            ),
      ),
    );
  }
}
