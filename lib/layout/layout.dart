import 'package:aman_dot/modules/drawer/feature_request/feature_request_screen.dart';
import 'package:aman_dot/modules/drawer/report_problem/report_problem_screen.dart';
import 'package:aman_dot/modules/drawer/how_to_use/how_to_use_screen.dart';
import 'package:aman_dot/modules/drawer/donation/donation_screen.dart';
import 'package:aman_dot/modules/drawer/about/about_screen.dart';
import 'package:aman_dot/modules/decrypt/file_decryption.dart';
import 'package:aman_dot/modules/decrypt/text_decryption.dart';
import 'package:aman_dot/modules/encrypt/file_encryption.dart';
import 'package:aman_dot/modules/encrypt/text_encryption.dart';
import 'package:aman_dot/modules/id_layers/id_layer_one.dart';
import 'package:aman_dot/shared/directory/app_directory.dart';
import 'package:aman_dot/shared/components/components.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  static String id = _HomeLayoutState.id!;
  static String reversedId = _HomeLayoutState.id!.split('').reversed.join();

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  static String? id;

  @override
  void initState() {
    super.initState();
    initUniqueIdentifierState();
    AppDirectory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: SizedBox(
          width: 288.0,
          child: Drawer(
            child: Container(
              color: Colors.grey[300],
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 160.0,
                      color: Colors.grey,
                    ),
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(
                        top: 5.0,
                      ),
                      shrinkWrap: true,
                      children: [
                        buildMenuItem(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HowToUse()));
                          },
                          icon: Icons.help_outline,
                          text: 'How to use',
                          color: Colors.brown,
                        ),
                        const Divider(
                          height: 0,
                          thickness: 0.5,
                        ),
                        buildMenuItem(
                          onTap: () {
                            Fluttertoast.showToast(
                              msg: 'This feature is coming soon ...',
                            );
                          },
                          icon: Icons.save_outlined,
                          text: 'Saved IDs',
                          color: Colors.green,
                        ),
                        const Divider(
                          height: 0,
                          thickness: 0.5,
                        ),
                        buildMenuItem(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReportProblem()));
                          },
                          icon: Icons.report_outlined,
                          text: 'Report a problem',
                          color: Colors.red,
                        ),
                        const Divider(
                          height: 0,
                          thickness: 0.5,
                        ),
                        buildMenuItem(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FeatureRequest()));
                          },
                          icon: Icons.wb_incandescent_outlined,
                          text: 'Feature request',
                          color: const Color.fromRGBO(218, 165, 32, 1),
                          rotate: 180 * math.pi / 180,
                        ),
                        const Divider(
                          height: 0,
                          thickness: 0.5,
                        ),
                        buildMenuItem(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Donation()));
                          },
                          icon: Icons.volunteer_activism_outlined,
                          text: 'Donation',
                          color: Colors.pink,
                        ),
                        const Divider(
                          height: 0,
                          thickness: 0.5,
                        ),
                        buildMenuItem(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const About()));
                          },
                          icon: Icons.announcement_outlined,
                          text: 'About',
                          color: Colors.brown,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
      appBar: buildAppBarForLayout(
        title: 'aman ',
        leading: Builder(
            builder: (context) => IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                )),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTextIconButton(
                  onPressed: () async {
                    Clipboard.setData(ClipboardData(
                            text:
                                await IdLayerOne().concatIdLayerOneDigits(id!)))
                        .then((value) => Fluttertoast.showToast(
                            msg: 'ID has been copied to clipboard'));
                  },
                  icon: Icons.copy,
                  text: 'Copy ID',
                  color: Colors.green,
                  backgroundColor: Colors.grey.shade300,
                ),
                const SizedBox(
                  width: 20,
                ),
                buildTextIconButton(
                  onPressed: () async {
                    Share.share(await IdLayerOne().concatIdLayerOneDigits(id!));
                  },
                  icon: Icons.share,
                  text: 'Share ID',
                  color: Colors.blue,
                  backgroundColor: Colors.grey.shade300,
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTextButtonIcon(
                    onPressed: () {
                      buildCustomDialog(
                        context: context,
                        textIcon: Icons.text_fields,
                        fileIcon: Icons.insert_drive_file_outlined,
                        onTextPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TextEncryption()),
                          );
                        },
                        onFilePressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FileEncryption()),
                          );
                        },
                        color: Colors.green,
                      );
                    },
                    icon: Icons.lock_outline,
                    text: 'ENCRYPTION',
                    backgroundColor: Colors.grey.shade300,
                    width: 172.0,
                    // borderColor: Colors.green,
                    iconColor: Colors.green,
                    textColor: Colors.green,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  buildTextButtonIcon(
                    onPressed: () {
                      buildCustomDialog(
                        context: context,
                        textIcon: Icons.text_fields,
                        fileIcon: Icons.insert_drive_file_outlined,
                        onTextPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TextDecryption()));
                        },
                        onFilePressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FileDecryption()));
                        },
                        color: Colors.red,
                      );
                    },
                    icon: Icons.lock_open_outlined,
                    text: 'DECRYPTION',
                    backgroundColor: Colors.grey.shade300,
                    width: 172.0,
                    // borderColor: Colors.red,
                    iconColor: Colors.red,
                    textColor: Colors.red,
                  ),
                  const SizedBox(
                    height: 104.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // this method gets the [Unique Identifier] for the device
  Future<void> initUniqueIdentifierState() async {
    try {
      id = (await UniqueIdentifier.serial)!;
    } on PlatformException {
      'Failed to get Unique Identifier';
    }
    if (!mounted) return;
  }
}
