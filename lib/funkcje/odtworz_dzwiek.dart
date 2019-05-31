import 'package:soundpool/soundpool.dart';
import 'package:flutter/services.dart';

void arrr() async {
  Soundpool arrr = Soundpool(streamType: StreamType.music);
  int _soundId = await rootBundle
      .load('zasoby/audio/AAAARRRR.mp3')
      .then((ByteData soundData) {
    return arrr.load(soundData);
  });
  await arrr.play(_soundId);
}

void major() async {
  Soundpool major = Soundpool(streamType: StreamType.music);
  int _soundId = await rootBundle
      .load('zasoby/audio/major.mp3')
      .then((ByteData soundData) {
    return major.load(soundData);
  });
  await major.play(_soundId);
}

void odtworzDzwiek(int idDzwieku) async {
  Soundpool dzwiek = Soundpool(streamType: StreamType.music);
  var nazwaDzwieku;
  switch (idDzwieku) {
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
    case 17:
      nazwaDzwieku = 'here_we_go';
      break;
    case 18:
      nazwaDzwieku = 'soczysta_bula';
      break;
    case 19:
      nazwaDzwieku = 'pierwsza_runda';
      break;
    case 20:
      nazwaDzwieku = 'ale_dostalem_bule';
      break;
    case 21:
      nazwaDzwieku = 'karniak_w_stopke';
      break;
    case 22:
      nazwaDzwieku = 'glupio_agresywnie';
      break;
    case 23:
      nazwaDzwieku = 'ale_zepsulem';
      break;
    case 24:
      nazwaDzwieku = 'big_time_frags';
      break;
    case 25:
      nazwaDzwieku = 'danke';
      break;
    case 26:
      nazwaDzwieku = 'dmg';
      break;
    case 27:
      nazwaDzwieku = 'raszing';
      break;
    case 28:
      nazwaDzwieku = 'jak_dzik_w_zoledzie';
      break;
    case 29:
      nazwaDzwieku = 'parostatek';
      break;
    case 30:
      nazwaDzwieku = 'fak_ju_no';
      break;
    case 31:
      nazwaDzwieku = 'orgazm';
      break;
  }

  int soundId = await rootBundle
      .load('zasoby/audio/przyciski/' + nazwaDzwieku + '.mp3')
      .then((ByteData soundData) {
    return dzwiek.load(soundData);
  });
  await dzwiek.play(soundId);
}
