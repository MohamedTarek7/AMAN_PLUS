import 'package:aman_dot/shared/directory/app_directory.dart';
import 'package:aman_dot/shared/file_picker/picker.dart';
import 'dart:io';

class SaveData {
  static String? filePath;

  // Save encrypted data into a [file]
  static Future<String> saveEncryptedData(encryptedBytes) async {
    final encryptDirectory = await AppDirectory.getEncryptionDir();
    File file = File('${encryptDirectory.path}/${Picker.fileName}');
    await file.writeAsBytes(await encryptedBytes).then((value) => filePath = value.path);
    return file.absolute.toString();
  }

  // Save decrypted data into a [file]
  static Future<String> saveDecryptedData(decryptedBytes) async {
    final decryptDirectory = await AppDirectory.getDecryptionDir();
    File file = File('${decryptDirectory.path}/${Picker.fileName}');
    await file.writeAsBytes(await decryptedBytes).then((value) => filePath = value.path);
    return file.absolute.toString();
  }
}
