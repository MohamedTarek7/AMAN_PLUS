import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future clearCache() async {
  var appDir = (await getTemporaryDirectory()).path;
  await Directory(appDir).delete(recursive: true);
}
