import 'package:soundpool/soundpool.dart';
import 'package:flutter/services.dart';

void odtworzDzwiek(int idDzwieku) async {
  Soundpool dzwiek = Soundpool(streamType: StreamType.music);
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