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
    case 6:
      nazwaDzwieku = 'ahh_jest';
      break;
    case 7:
      nazwaDzwieku = 'jebaniutki';
      break;
    case 8:
      nazwaDzwieku = 'wooolny_jestem';
      break;
    case 9:
      nazwaDzwieku = 'AAA_szkoda';
      break;
    case 10:
      nazwaDzwieku = 'ajj_nieprzyjemnie';
      break;
    case 11:
      nazwaDzwieku = 'famas';
      break;
    case 12:
      nazwaDzwieku = 'famas_2';
      break;
    case 13:
      nazwaDzwieku = 'niee';
      break;
    case 14:
      nazwaDzwieku = 'nie_bawie_sie_tak';
      break;
    case 15:
      nazwaDzwieku = 'kormoran';
      break;
  }

  int soundId = await rootBundle.load('zasoby/audio/' + nazwaDzwieku + '.mp3').then((ByteData soundData) {
    return dzwiek.load(soundData);
  });
  await dzwiek.play(soundId);
}