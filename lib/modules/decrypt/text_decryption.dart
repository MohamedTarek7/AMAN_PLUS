import 'package:aman_dot/modules/id_layers/id_layer_one.dart';
import 'package:aman_dot/modules/id_layers/id_layer_two.dart';
import 'package:aman_dot/shared/aesEncryptDecrypt/aes.dart';
import 'package:aman_dot/shared/components/components.dart';
import 'package:aman_dot/shared/components/constants.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:aman_dot/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextDecryption extends StatefulWidget {
  const TextDecryption({Key? key}) : super(key: key);

  static TextEditingController? textController = TextEditingController();

  static String id = HomeLayout.id;

  static String idLayerTwo = IdLayerTwo().concatIdLayerTwoDigits(
      IdLayerTwo().splitIDLayerOne(IdLayerOne().concatIdLayerOneDigits(id)));

  @override
  State<TextDecryption> createState() => _TextDecryptionState();
}

class _TextDecryptionState extends State<TextDecryption> {
  final formKey = GlobalKey<FormState>();

  bool isTextFieldTapped = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        TextDecryption.textController!.text = '';
        clearCache();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: buildAppBar(
          title: 'text decryption',
          leading: IconButton(
            onPressed: () {
              TextDecryption.textController!.text = '';
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
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    buildTextFormField(
                      controller: TextDecryption.textController,
                      labelText: 'Type or paste text here',
                      maxLines: 10,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Text field must not be empty!';
                        }
                      },
                      onTap: () {
                        setState(() {
                          isTextFieldTapped = true;
                        });
                      },
                    ),
                    BuildCondition(
                      condition: isTextFieldTapped,
                      builder: (context) => buildOptionButtons(
                        onPressedPaste: () async {
                          await Clipboard.getData(Clipboard.kTextPlain)
                              .then((value) {
                            if (value!.text!.isNotEmpty) {
                              TextDecryption.textController!.text =
                                  value.text.toString();
                            }
                          }).onError((error, stackTrace) {
                            Fluttertoast.showToast(
                              msg: 'Clipboard is empty!',
                              textColor: Colors.red,
                              backgroundColor: Colors.white,
                            );
                          });
                        },
                        onPressedCopy: () {
                          if (TextDecryption.textController!.text.isNotEmpty) {
                            Clipboard.setData(ClipboardData(
                                    text: TextDecryption.textController!.text))
                                .then((value) {
                              Fluttertoast.showToast(
                                msg: 'Text has been copied to clipboard!',
                              );
                            });
                          }
                        },
                        onPressedClear: () {
                          TextDecryption.textController!.text = '';
                          clearCache();
                        },
                        onPressedShare: () {},
                        enableShare: false,
                      ),
                      fallback: null,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    buildTextButtonIcon(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          // logic
                          try {
                            TextDecryption.textController!.text =
                                await Aes.textDecryption(
                                    TextDecryption.textController!.text);
                          } catch (err) {
                            Fluttertoast.showToast(
                              msg: 'Invalid or corrupted data!',
                              textColor: Colors.red,
                              backgroundColor: Colors.white,
                            );
                            return err;
                          }

                          // clear cached data
                          clearCache();
                        }
                      },
                      icon: Icons.lock_open_outlined,
                      text: 'DECRYPT',
                      backgroundColor: Colors.grey.shade300,
                      width: 145.0,
                      iconColor: Colors.red,
                      textColor: Colors.red,
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
