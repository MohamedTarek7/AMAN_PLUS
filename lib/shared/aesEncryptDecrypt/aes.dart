import 'package:aman_dot/modules/decrypt/file_decryption.dart';
import 'package:aman_dot/modules/decrypt/text_decryption.dart';
import 'package:aman_dot/modules/encrypt/file_encryption.dart';
import 'package:aman_dot/modules/encrypt/text_encryption.dart';
import 'package:encrypt/encrypt.dart' as aes;

class Aes {
  // [Key] and [IV] used for text encryption
  static var textEncryptionKey = aes.Key.fromUtf8(TextEncryption.idLayerTwo);
  static var textEncryptionIv = aes.IV.fromUtf8(TextEncryption.reversedId!);

  // text encryption method
  static Future<String> textEncryption(String plainText) async {
    final encrypter = aes.Encrypter(aes.AES(textEncryptionKey, mode: aes.AESMode.cbc));
    final encrypted = encrypter.encrypt(plainText, iv: textEncryptionIv);
    return encrypted.base64;
  }

  // [Key] and [IV] used for file encryption
  static var fileEncryptionKey = aes.Key.fromUtf8(FileEncryption.idLayerTwo);
  static var fileEncryptionIv = aes.IV.fromUtf8(FileEncryption.reversedId!);

  // file encryption method
  static Future<dynamic> fileEncryption(plainBytes) async {
    final encrypter = aes.Encrypter(aes.AES(fileEncryptionKey, mode: aes.AESMode.cbc));
    final encrypted = encrypter.encryptBytes(await plainBytes, iv: fileEncryptionIv);
    return encrypted.bytes;
  }

  // [Key] and [IV] used for text decryption
  static final textDecryptionKey = aes.Key.fromUtf8(TextDecryption.idLayerTwo);
  static final textDecryptionIv = aes.IV.fromUtf8(TextDecryption.id.split('').reversed.join());

  // text decryption method
  static Future<String> textDecryption(String cipherText) async {
    final encrypter = aes.Encrypter(aes.AES(textDecryptionKey, mode: aes.AESMode.cbc));
    final decrypted = encrypter.decrypt(aes.Encrypted.fromBase64(cipherText), iv: textDecryptionIv);
    return decrypted;
  }

  // [Key] and [IV] used for file decryption
  static final fileDecryptionKey = aes.Key.fromUtf8(FileDecryption.idLayerTwo);
  static final fileDecryptionIv = aes.IV.fromUtf8(FileDecryption.id.split('').reversed.join());

  // file decryption method
  static Future<dynamic> fileDecryption(cipherBytes) async {
    final decrypter = aes.Encrypter(aes.AES(fileDecryptionKey, mode: aes.AESMode.cbc));
    final decrypted = decrypter.decryptBytes(aes.Encrypted(await cipherBytes), iv: fileDecryptionIv);
    return decrypted;
  }
}
