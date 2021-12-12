import 'package:aman_dot/shared/components/components.dart';
import 'package:aman_dot/shared/components/constants.dart';
import 'package:flutter/material.dart';

class FeatureRequest extends StatelessWidget {
  FeatureRequest({Key? key}) : super(key: key);

  final TextEditingController textController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
          title: 'feature request',
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
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: buildTextFormField(
                        readOnly: true,
                        controller: textController,
                        labelText: 'Type features/ideas here',
                        maxLines: 10,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This feature will be available soon ...'; // Feature field must not be empty!
                          }
                        },
                      ),
                    ),
                    buildTextButtonIcon(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // logic
                        }
                      },
                      icon: Icons.send,
                      text: 'Send',
                      backgroundColor: Colors.grey.shade300,
                      width: 145.0,
                      // borderColor: Colors.green,
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
