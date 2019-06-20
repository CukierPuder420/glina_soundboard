import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

AudioPlayer audioPlayer = AudioPlayer();
AudioCache audioCache = AudioCache();

var randomizer = Random();

void arrr() async {
  int wybor = randomizer.nextInt(3);
  switch (wybor) {
    case 0:
      await audioCache.play('audio/AAAARRRR.mp3');
      break;
    case 1:
      await audioCache.play('audio/ahuhu.mp3');
      break;
    case 2:
      await audioCache.play('audio/alyly.mp3');
      break;
  }
}

void major() async {
  await audioCache.play('audio/major.mp3');
}

void odtworzDzwiek(int idDzwieku) async {
  var nazwaDzwieku;
  switch (idDzwieku) {
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
      nazwaDzwieku = 'parostatek1';
      break;
    case 30:
      nazwaDzwieku = 'fak_ju_no';
      break;
    case 31:
      nazwaDzwieku = 'orgazm';
      break;
    case 32:
      nazwaDzwieku = 'spokojnie';
      break;
    case 33:
      nazwaDzwieku = 'az_sie_spocilem';
      break;
    case 34:
      nazwaDzwieku = 'parostatek2';
      break;
    case 35:
      nazwaDzwieku = 'nie_tuptaj';
      break;
    case 36:
      nazwaDzwieku = 'popus_graj';
      break;
    case 37:
      nazwaDzwieku = 'patrzcie_ziemniora';
      break;
    case 38:
      nazwaDzwieku = 'pestkownia';
      break;
    case 39:
      nazwaDzwieku = 'tuptuptup';
      break;
    case 40:
      nazwaDzwieku = 'groszek_ty_cwelu';
      break;
    case 41:
      nazwaDzwieku = 'ale_kichne';
      break;
    case 42:
      nazwaDzwieku = 'tylko_gesiego';
      break;
    case 43:
      nazwaDzwieku = 'gdzie_jest';
      break;
    case 44:
      nazwaDzwieku = 'nowotwor';
      break;
    case 45:
      nazwaDzwieku = 'mac';
      break;
    case 47:
      nazwaDzwieku = 'bot_ulryk';
      break;
    case 48:
      nazwaDzwieku = '500-';
      break;
    case 49:
      nazwaDzwieku = 'jak_zwykle';
      break;
    case 50:
      nazwaDzwieku = 'powstanie_styczniowe';
      break;
  }

  String sciezkaPliku = 'audio/przyciski/' + nazwaDzwieku + '.mp3';
  await audioCache.play(sciezkaPliku);
}
