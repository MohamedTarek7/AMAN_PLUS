import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class AppDirectory {
  static bool isGranted = false;

  AppDirectory() {
    reqStoragePermission();
    getEncryptionDir();
    getDecryptionDir();
  }

  static Future reqStoragePermission() async {
    PermissionStatus status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request().then((_) async {
        if (await Permission.storage.status.isDenied) {
          isGranted = false;
        } else {
          isGranted = true;
        }
      });
    }
  }

  static Future<Directory> getEncryptionDir() async {
    if (await Directory('/storage/emulated/0/AmanPlus/Encrypted').exists()) {
      final encryptDir = Directory('/storage/emulated/0/AmanPlus/Encrypted');
      return encryptDir;
    } else {
      await Directory('/storage/emulated/0/AmanPlus/Encrypted')
          .create(recursive: true);
      final encryptDir = Directory('/storage/emulated/0/AmanPlus/Encrypted');
      return encryptDir;
    }
  }

  static Future<Directory> getDecryptionDir() async {
    if (await Directory('/storage/emulated/0/AmanPlus/Decrypted').exists()) {
      final encryptDir = Directory('/storage/emulated/0/AmanPlus/Decrypted');
      return encryptDir;
    } else {
      await Directory('/storage/emulated/0/AmanPlus/Decrypted')
          .create(recursive: true);
      final encryptDir = Directory('/storage/emulated/0/AmanPlus/Decrypted');
      return encryptDir;
    }
  }
}
