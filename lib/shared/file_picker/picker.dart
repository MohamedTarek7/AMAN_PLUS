import 'package:file_picker/file_picker.dart';
import 'dart:io';

class Picker {
  static var fileBytes = [];
  static String? fileName;

  static Future filePicker() async {
    final result = await FilePicker.platform.pickFiles().catchError((err) {
      return err;
    });

    if (result != null) {
      final file = result.files.first;
      fileName = file.name;
      final newFile = File(file.path!);
      fileBytes = await newFile.readAsBytes();
    } else {
      fileName = null;
    }
  }
}
