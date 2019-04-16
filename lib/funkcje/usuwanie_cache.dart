import 'package:path_provider/path_provider.dart';
import 'dart:io';

void usuwanieCache() async {
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  Directory(tempPath).delete(recursive: true);
}