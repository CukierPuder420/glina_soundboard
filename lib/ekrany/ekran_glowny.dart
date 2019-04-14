import 'package:flutter/material.dart';
import 'package:glina_soundboard/funkcje/odtworz_dzwiek.dart';
//import 'package:shake/shake.dart';

class EkranGlowny extends StatelessWidget {
  /*ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        odtworzDzwiek(5);
      }
  );*/

  Container kontener(int idDzwieku, var opis, Color kolor) {
    return new Container(
      child: RaisedButton(
        onPressed: (){
          odtworzDzwiek(idDzwieku);
        },
        child: Text(opis),
        color: kolor,
      ),
    );
  }

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
            SliverFixedExtentList(
              itemExtent: 130.0,
              delegate: SliverChildListDelegate(
                [
                  kontener(1, 'AAAAA kurwa', Colors.pink),
                  kontener(2, 'lallouleciak napleciak', Colors.yellow),
                  kontener(3, 'strasznie głupio', Colors.purple),
                  kontener(4, '*jęk*', Colors.tealAccent),
                ],
              ),
            ),
          ],
        )
    );
  }
}