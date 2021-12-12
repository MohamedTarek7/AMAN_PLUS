import 'package:aman_dot/shared/components/components.dart';
import 'package:flutter/material.dart';

class HowToUse extends StatelessWidget {
  const HowToUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: buildAppBar(
        title: 'how to use',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 16.0,
            end: 16.0,
            top: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Sender:',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                  )),
              SizedBox(
                height: 10.0,
              ),
              Text('•   Ask the recipient for their ID',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  )),
              SizedBox(
                height: 5.0,
              ),
              Text('•   Press the ENCRYPT button',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  )),
              SizedBox(
                height: 5.0,
              ),
              Text('•   Choose Text/File',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  )),
              SizedBox(
                height: 5.0,
              ),
              Text('•   Put ID in ID\'s field',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  )),
              SizedBox(
                height: 5.0,
              ),
              Text('•   Type/Paste text or Select file to encrypt',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  )),
              SizedBox(
                height: 5.0,
              ),
              Text('•   Hit the ENCRYPT button',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  )),
              Divider(
                thickness: 1.0,
                height: 50.0,
              ),
              Text('Recipient:',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20.0,
                  )),
              SizedBox(
                height: 10.0,
              ),
              Text('•   Send your ID to the sender',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  )),
              SizedBox(
                height: 5.0,
              ),
              Text('•   Wait for encrypted data',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  )),
              SizedBox(
                height: 5.0,
              ),
              Text('•   Press the DECRYPT button',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  )),
              SizedBox(
                height: 5.0,
              ),
              Text('•   Choose Text/File',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  )),
              SizedBox(
                height: 5.0,
              ),
              Text('•   Type/Paste text or Select file to decrypt',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  )),
              SizedBox(
                height: 5.0,
              ),
              Text('•   Hit the DECRYPT button',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  )),
              Divider(
                thickness: 1.0,
                height: 50.0,
              ),
              Text('Notes:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  )),
              SizedBox(
                height: 5.0,
              ),
              Text('• Encrypted files are saved in main storage under:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11.5,
                  )),
              Text('   AmanPlus/Encrypted',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11.5,
                  )),
              SizedBox(
                height: 5.0,
              ),
              Text('• Decrypted files are saved in main storage under:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11.5,
                  )),
              Text('   AmanPlus/Decrypted',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11.5,
                  )),
              SizedBox(
                height: 5.0,
              ),
              Text(
                  '• You are able to encrypt text/files for yourself using your ID',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11.5,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
