import 'dart:io';

import 'package:path_provider/path_provider.dart';

void usuwanieCache() async {
  final tempDir = await getTemporaryDirectory();
  final tempPath = tempDir.path;
  Directory(tempPath).delete(recursive: true);
}
