import 'package:aman_dot/modules/id_layers/back_from_id_layer_one_to_id.dart';
import 'package:aman_dot/modules/id_layers/id_layer_two.dart';
import 'package:aman_dot/shared/components/components.dart';
import 'package:aman_dot/shared/aesEncryptDecrypt/aes.dart';
import 'package:aman_dot/shared/components/constants.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:encrypt/encrypt.dart' as aes;
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextEncryption extends StatefulWidget {
  const TextEncryption({Key? key}) : super(key: key);

  static TextEditingController textController = TextEditingController();
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
  State<TextEncryption> createState() => _TextEncryptionState();
}

class _TextEncryptionState extends State<TextEncryption> {
  final formKey = GlobalKey<FormState>();

  bool isIdFieldTapped = false;
  bool isTextFieldTapped = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        TextEncryption.idController.text = '';
        TextEncryption.textController.text = '';
        clearCache();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: buildAppBar(
          title: 'text encryption',
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              TextEncryption.idController.text = '';
              TextEncryption.textController.text = '';
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
                        controller: TextEncryption.idController,
                        labelText: 'Type or paste ID here',
                        maxLines: 1,
                        focusedBorderColor: Colors.green,
                        validator: (value) {
                          if (value!.isEmpty || value.length != 32) {
                            return 'ID field must not be empty! and should be 32 characters';
                          }
                        },
                        onTap: () {
                          setState(() {
                            isIdFieldTapped = true;
                            isTextFieldTapped = false;
                          });
                        }),
                    BuildCondition(
                      condition: isIdFieldTapped,
                      builder: (context) => buildOptionButtons(
                        onPressedPaste: () async {
                          await Clipboard.getData(Clipboard.kTextPlain)
                              .then((value) {
                            if (value!.text!.length == 32) {
                              TextEncryption.idController.text =
                                  value.text.toString();
                            } else {
                              Fluttertoast.showToast(
                                msg: 'ID must be 32 characters length!',
                                textColor: Colors.red,
                                backgroundColor: Colors.white,
                              );
                            }
                          }).onError((error, stackTrace) {
                            Fluttertoast.showToast(
                              msg: 'Clipboard is empty!',
                              textColor: Colors.red,
                              backgroundColor: Colors.white,
                            );
                          });
                        },
                        onPressedCopy: () {},
                        onPressedClear: () {
                          TextEncryption.idController.text = '';
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
                      controller: TextEncryption.textController,
                      labelText: 'Type or paste text here',
                      maxLines: 10,
                      focusedBorderColor: Colors.green,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Text field must not be empty!';
                        }
                      },
                      onTap: () {
                        setState(() {
                          isTextFieldTapped = true;
                          isIdFieldTapped = false;
                        });
                      },
                    ),
                    BuildCondition(
                      condition: isTextFieldTapped,
                      builder: (context) =>
                          buildOptionButtons(onPressedPaste: () async {
                        await Clipboard.getData(Clipboard.kTextPlain)
                            .then((value) {
                          if (value!.text!.isNotEmpty) {
                            TextEncryption.textController.text =
                                value.text.toString();
                          }
                        }).onError((error, stackTrace) {
                          Fluttertoast.showToast(
                            msg: 'Clipboard is empty!',
                            textColor: Colors.red,
                            backgroundColor: Colors.white,
                          );
                        });
                      }, onPressedCopy: () {
                        if (TextEncryption.textController.text.isNotEmpty) {
                          Clipboard.setData(ClipboardData(
                                  text: TextEncryption.textController.text))
                              .then((value) {
                            Fluttertoast.showToast(
                              msg: 'Text has been copied to clipboard!',
                            );
                          });
                        }
                      }, onPressedClear: () {
                        TextEncryption.textController.text = '';
                        clearCache();
                      }, onPressedShare: () {
                        if (TextEncryption.textController.text.isNotEmpty) {
                          Share.share(TextEncryption.textController.text);
                        }
                      }),
                      fallback: null,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    buildTextButtonIcon(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          // logic
                          TextEncryption.idLayerOne =
                              TextEncryption.idController.text;
                          TextEncryption.reversedId = BackFromIdLayerOneToId()
                              .backFromIdLayerOneToId(BackFromIdLayerOneToId()
                                  .splitIDLayerOne(TextEncryption.idLayerOne!))
                              .split('')
                              .reversed
                              .join();
                          TextEncryption.idLayerTwo = IdLayerTwo()
                              .concatIdLayerTwoDigits(IdLayerTwo()
                                  .splitIDLayerOne(TextEncryption.idLayerOne!));
                          Aes.textEncryptionKey =
                              aes.Key.fromUtf8(TextEncryption.idLayerTwo);
                          Aes.textEncryptionIv =
                              aes.IV.fromUtf8(TextEncryption.reversedId!);
                          TextEncryption.textController.text =
                              await Aes.textEncryption(
                                  TextEncryption.textController.text);
                          // clear cached data
                          clearCache();
                        }
                      },
                      icon: Icons.lock_outline,
                      text: 'ENCRYPT',
                      backgroundColor: Colors.grey.shade300,
                      width: 145.0,
                      iconColor: Colors.green,
                      textColor: Colors.green,
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
