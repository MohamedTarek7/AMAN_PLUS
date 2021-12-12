import 'package:aman_dot/modules/id_layers/id_layer_one.dart';
import 'package:aman_dot/modules/id_layers/id_layer_two.dart';
import 'package:aman_dot/shared/aesEncryptDecrypt/aes.dart';
import 'package:aman_dot/shared/components/components.dart';
import 'package:aman_dot/shared/components/constants.dart';
import 'package:aman_dot/shared/file_picker/picker.dart';
import 'package:aman_dot/shared/saveData/save_data.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:aman_dot/layout/layout.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';

class FileDecryption extends StatefulWidget {
  const FileDecryption({Key? key}) : super(key: key);

  static String id = HomeLayout.id;

  static String idLayerTwo = IdLayerTwo().concatIdLayerTwoDigits(
      IdLayerTwo().splitIDLayerOne(IdLayerOne().concatIdLayerOneDigits(id)));

  @override
  State<FileDecryption> createState() => _FileDecryptionState();
}

class _FileDecryptionState extends State<FileDecryption> {
  final TextEditingController fileController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String loadingMsg = '';

  bool decrypted = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        clearCache();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: buildAppBar(
          title: 'file decryption',
          leading: IconButton(
            onPressed: () {
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
                          isLoading = true;
                          loadingMsg = 'Loading file ...';
                        });
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
                          setState(() {
                            isLoading = false;
                            loadingMsg = '';
                          });
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'File field must not be empty!';
                        }
                      },
                    ),
                    BuildCondition(
                      condition: decrypted,
                      builder: (context) => buildOpenButton(onPressedOpen: () {
                        OpenFile.open(SaveData.filePath);
                      }),
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
                            loadingMsg = 'Decrypting file ...';
                          });
                          // logic
                          try {
                            final decryptedBytes =
                                await Aes.fileDecryption(Picker.fileBytes);

                            setState(() {
                              isLoading = true;
                              loadingMsg = 'Saving file ...';
                            });

                            await SaveData.saveDecryptedData(
                                    await decryptedBytes)
                                .then((value) async {
                              setState(() {
                                isLoading = false;
                                decrypted = true;
                              });
                              Fluttertoast.showToast(
                                msg: 'File decrypted successfuly at $value',
                              );
                              // clear cached data
                              clearCache();
                            });
                          } catch (err) {
                            setState(() {
                              isLoading = false;
                              loadingMsg = '';
                            });
                            Fluttertoast.showToast(
                              msg: 'Invalid or corrupted file!',
                              textColor: Colors.red,
                              backgroundColor: Colors.white,
                            );
                            return err;
                          }
                        }
                      },
                      icon: Icons.lock_open_outlined,
                      text: 'DECRYPT',
                      backgroundColor: Colors.grey.shade300,
                      width: 145.0,
                      iconColor: Colors.red,
                      textColor: Colors.red,
                    ),
                    const SizedBox(height: 30.0),
                    BuildCondition(
                      condition: isLoading,
                      builder: (context) => Center(
                        child: Center(
                          child: Column(
                            children: [
                              const CircularProgressIndicator(
                                color: Colors.red,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(loadingMsg,
                                  style: const TextStyle(
                                    color: Colors.red,
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
