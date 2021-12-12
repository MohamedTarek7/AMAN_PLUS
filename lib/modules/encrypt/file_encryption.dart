import 'package:aman_dot/modules/id_layers/back_from_id_layer_one_to_id.dart';
import 'package:aman_dot/modules/id_layers/id_layer_two.dart';
import 'package:aman_dot/shared/aesEncryptDecrypt/aes.dart';
import 'package:aman_dot/shared/components/components.dart';
import 'package:aman_dot/shared/components/constants.dart';
import 'package:aman_dot/shared/file_picker/picker.dart';
import 'package:aman_dot/shared/saveData/save_data.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:encrypt/encrypt.dart' as aes;
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FileEncryption extends StatefulWidget {
  const FileEncryption({Key? key}) : super(key: key);

  static TextEditingController idController = TextEditingController();

  static String? idLayerOne;

  static String? reversedId = BackFromIdLayerOneToId()
      .backFromIdLayerOneToId(
          BackFromIdLayerOneToId().splitIDLayerOne(idLayerOne!))
      .split('')
      .reversed
      .join();

  static String idLayerTwo = IdLayerTwo()
      .concatIdLayerTwoDigits(IdLayerTwo().splitIDLayerOne(idLayerOne!));

  @override
  State<FileEncryption> createState() => _FileEncryptionState();
}

class _FileEncryptionState extends State<FileEncryption> {
  final TextEditingController fileController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String loadingMsg = '';

  bool isIdFieldTapped = false;

  bool encrypted = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FileEncryption.idController.text = '';
        clearCache();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: buildAppBar(
          title: 'file encryption',
          leading: IconButton(
            onPressed: () {
              FileEncryption.idController.text = '';
              Navigator.pop(context);
              clearCache();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20.0),
                    buildTextFormField(
                      maxLength: 32,
                      controller: FileEncryption.idController,
                      labelText: 'Type or paste ID here',
                      maxLines: 1,
                      validator: (value) {
                        if (value!.isEmpty || value.length != 32) {
                          return 'ID field must not be empty! and should be 32 characters';
                        }
                      },
                      onTap: () {
                        setState(() {
                          isIdFieldTapped = true;
                        });
                      },
                    ),
                    BuildCondition(
                      condition: isIdFieldTapped,
                      builder: (context) => buildOptionButtons(
                        onPressedPaste: () async {
                          await Clipboard.getData(Clipboard.kTextPlain)
                              .then((value) {
                            if (value!.text!.length == 32) {
                              FileEncryption.idController.text =
                                  value.text.toString();
                            } else {
                              Fluttertoast.showToast(
                                msg: 'Length should be 32 characters!',
                                textColor: Colors.red,
                                backgroundColor: Colors.white,
                              );
                            }
                          });
                        },
                        onPressedCopy: () {},
                        onPressedClear: () {
                          FileEncryption.idController.text = '';
                          clearCache();
                        },
                        onPressedShare: () {},
                        enableCopy: false,
                        enableShare: false,
                      ),
                      fallback: null,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    buildTextFormField(
                      controller: fileController,
                      prefixIcon: Icons.insert_drive_file_outlined,
                      readOnly: true,
                      labelText: 'Tap to select a file',
                      maxLines: 2,
                      onTap: () async {
                        setState(() {
                          isIdFieldTapped = false;
                        });
                        if (FileEncryption.idController.text.isNotEmpty) {
                          setState(() {
                            isLoading = true;
                            loadingMsg = 'Loading file ...';
                          });
                        }
                        await Picker.filePicker();
                        if (Picker.fileName == null) {
                          setState(() {
                            isLoading = false;
                            loadingMsg = '';
                          });
                          if (fileController.text.isEmpty) {
                            Fluttertoast.showToast(msg: 'Select a file!');
                          }
                        } else {
                          fileController.text = Picker.fileName!;
                          if (FileEncryption.idController.text.isNotEmpty) {
                            setState(() {
                              isLoading = false;
                              loadingMsg = '';
                            });
                          }
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'File field must not be empty!';
                        }
                      },
                    ),
                    BuildCondition(
                      condition: encrypted,
                      builder: (context) => buildOptionButtons(
                        onPressedPaste: () {},
                        onPressedCopy: () {},
                        onPressedClear: () {},
                        onPressedShare: () {
                          Share.shareFiles([SaveData.filePath!]);
                        },
                        enablePaste: false,
                        enableCopy: false,
                        enableClear: false,
                      ),
                      fallback: null,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    buildTextButtonIcon(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                            loadingMsg = 'Encrypting file ...';
                          });

                          FileEncryption.idLayerOne =
                              FileEncryption.idController.text;
                          FileEncryption.reversedId = BackFromIdLayerOneToId()
                              .backFromIdLayerOneToId(BackFromIdLayerOneToId()
                                  .splitIDLayerOne(FileEncryption.idLayerOne!))
                              .split('')
                              .reversed
                              .join();
                          FileEncryption.idLayerTwo = IdLayerTwo()
                              .concatIdLayerTwoDigits(IdLayerTwo()
                                  .splitIDLayerOne(FileEncryption.idLayerOne!));
                          Aes.fileEncryptionKey =
                              aes.Key.fromUtf8(FileEncryption.idLayerTwo);
                          Aes.fileEncryptionIv =
                              aes.IV.fromUtf8(FileEncryption.reversedId!);

                          final encryptedBytes =
                              await Aes.fileEncryption(Picker.fileBytes);

                          setState(() {
                            isLoading = true;
                            loadingMsg = 'Saving file ...';
                          });
                          await SaveData.saveEncryptedData(await encryptedBytes)
                              .then((value) async {
                            setState(() {
                              isLoading = false;
                              encrypted = true;
                            });
                            Fluttertoast.showToast(
                                msg: 'File encrypted successfuly at $value');
                            // clear cached data
                            clearCache();
                          });
                        }
                      },
                      icon: Icons.lock_outline,
                      text: 'ENCRYPT',
                      backgroundColor: Colors.grey.shade300,
                      width: 145.0,
                      iconColor: Colors.green,
                      textColor: Colors.green,
                    ),
                    const SizedBox(height: 30.0),
                    BuildCondition(
                      condition: isLoading,
                      builder: (context) => Center(
                        child: Center(
                          child: Column(
                            children: [
                              const CircularProgressIndicator(
                                color: Colors.green,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(loadingMsg,
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 16.0,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      fallback: null,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
