import 'package:flutter/material.dart';
import 'package:soundpool/soundpool.dart';
import 'package:flutter/services.dart';
//import 'package:shake/shake.dart';

void main() => runApp(GlinaSoundboard());

class GlinaSoundboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glina soundboard',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: StronaStartowa(tytul: 'Glina soundboard'),
    );
  }
}

class StronaStartowa extends StatefulWidget {
  StronaStartowa({Key klucz, this.tytul}) : super(key: klucz);

  final String tytul;

  @override
  _StronaStartowaState createState() => _StronaStartowaState();
}

class _StronaStartowaState extends State<StronaStartowa> {

  Soundpool dzwiek = Soundpool(streamType: StreamType.music);

  void odtworzDzwiek(int idDzwieku) async {
    var nazwaDzwieku;
    switch(idDzwieku) {
      case 0:
        nazwaDzwieku = 'major';
        break;
      case 1:
        nazwaDzwieku = 'AAAAA_kurwa';
        break;
      case 2:
        nazwaDzwieku = 'lalloueciak_napleciak';
        break;
      case 3:
        nazwaDzwieku = 'strasznie_glupio';
        break;
      case 4:
        nazwaDzwieku = 'jek';
        break;
      case 5:
        nazwaDzwieku = 'AAAARRRR';
        break;
    }

    int soundId = await rootBundle.load('zasoby/audio/' + nazwaDzwieku + '.mp3').then((ByteData soundData) {
      return dzwiek.load(soundData);
    });
    await dzwiek.play(soundId);
  }

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