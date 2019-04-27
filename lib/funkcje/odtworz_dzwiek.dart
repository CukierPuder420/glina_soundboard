import 'package:soundpool/soundpool.dart';
import 'package:flutter/services.dart';

void arrr() async {
  Soundpool arrr = Soundpool(streamType: StreamType.music);
  int _soundId = await rootBundle.load('zasoby/audio/AAAARRRR.mp3').then((ByteData soundData) {
    return arrr.load(soundData);
  });
  await arrr.play(_soundId);
}

void major() async {
  Soundpool major = Soundpool(streamType: StreamType.music);
  int _soundId = await rootBundle.load('zasoby/audio/major.mp3').then((ByteData soundData) {
    return major.load(soundData);
  });
  await major.play(_soundId);
}

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
    case 16:
      nazwaDzwieku = 'tak_jest';
      break;
  }

  int soundId = await rootBundle.load('zasoby/audio/przyciski/' + nazwaDzwieku + '.mp3').then((ByteData soundData) {
    return dzwiek.load(soundData);
  });
  await dzwiek.play(soundId);
}