import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

Future<String> get _sciezkaLokalna async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}



List listaDzwiekow() {
  var pliki = List();
  final sciezkaLokalna = _sciezkaLokalna;
  sciezkaLokalna.list(recursive: no, followLinks: false).listen(FileSystemEntity plik) {
    pliki.add(plik);
  }
}

