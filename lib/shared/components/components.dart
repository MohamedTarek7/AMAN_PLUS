import 'package:buildcondition/buildcondition.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

/// this Widget gives the ability to create
/// a customized [Button] of [Text] and [Icon].
Widget buildTextIconButton({
  required IconData icon,
  required String text,
  required Color color,
  required void Function()? onPressed,
  required Color backgroundColor,
}) =>
    Container(
      width: 70.0,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(4, 4),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: TextButton(
          onPressed: onPressed,
          child: Column(
            children: [
              Icon(
                icon,
                color: color,
                size: 21.0,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                text,
                style: TextStyle(
                    color: color, fontSize: 14.0, fontWeight: FontWeight.w400),
              ),
            ],
          )),
    );

///
Widget buildTextButtonIcon({
  required IconData icon,
  required String text,
  required Color backgroundColor,
  required Function() onPressed,
  Color iconColor = Colors.white,
  Color textColor = Colors.white,
  double width = 120.0,
  double height = 48.0,
  double fontSize = 20.0,
  double iconSize = 24.0,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          25.0,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(4, 4),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: TextButton.icon(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
          label: Text(
            text,
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
                color: textColor),
          )),
    );

/// Menu item
Widget buildMenuItem({
  required Function() onTap,
  required IconData icon,
  required String text,
  Color color = Colors.black54,
  double rotate = 0.0,
}) =>
    InkWell(
      child: ListTile(
        onTap: onTap,
        leading: Transform.rotate(
            angle: rotate,
            child: Icon(
              icon,
              color: color,
            )),
        title: Text(
          text,
          style: const TextStyle(fontSize: 17.0),
        ),
      ),
    );

/// custom [Dialog] includes modified [buildTextButtonIcon]
void buildCustomDialog({
  required BuildContext context,
  required Function() onTextPressed,
  required Function() onFilePressed,
  required IconData textIcon,
  required IconData fileIcon,
  Color color = Colors.black,
}) =>
    showDialog(
        context: context,
        builder: (context) => Dialog(
              backgroundColor: Colors.grey[300],
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      top: 16.0,
                      bottom: 8.0,
                    ),
                    child: buildTextButtonIcon(
                      icon: textIcon,
                      text: 'Text',
                      backgroundColor: Colors.grey.shade300,
                      onPressed: onTextPressed,
                      iconColor: color,
                      textColor: color,
                      // borderColor: color,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      top: 8.0,
                      bottom: 16.0,
                    ),
                    child: buildTextButtonIcon(
                      icon: fileIcon,
                      text: 'File',
                      backgroundColor: Colors.grey.shade300,
                      onPressed: onFilePressed,
                      iconColor: color,
                      textColor: color,
                      // borderColor: color,
                    ),
                  ),
                ],
              ),
            ));

/// AppBar
PreferredSizeWidget buildAppBarForLayout({
  Widget? leading,
  String title = '',
}) =>
    AppBar(
      elevation: 2.0,
      backgroundColor: Colors.grey[300],
      leading: leading,
      title: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 22.0,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ),
      centerTitle: true,
      actions: [
        Stack(
          children: [
            const Text(
              '+',
              style: TextStyle(
                fontSize: 43.5,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            Text(
              '+',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.yellow[700],
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 98.55,
        ),
        IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: 'Dark mode is coming soon ...',
              );
            },
            icon: const Icon(
              Icons.dark_mode,
              color: Colors.black,
            )),
      ],
    );

/// AppBar
PreferredSizeWidget buildAppBar({
  Widget? leading,
  String title = '',
}) =>
    AppBar(
      elevation: 2.0,
      backgroundColor: Colors.grey[300],
      leading: leading,
      title: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 22.0,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: 'Dark mode is coming soon ...',
              );
            },
            icon: const Icon(
              Icons.dark_mode,
              color: Colors.black,
            )),
      ],
    );

/// textFormField
Widget buildTextFormField({
  TextEditingController? controller,
  String? labelText,
  Color focusedBorderColor = Colors.blue,
  int maxLines = 1,
  String? Function(String?)? validator,
  void Function()? onTap,
  bool readOnly = false,
  IconData? prefixIcon,
  Color prefixIconColor = Colors.black54,
  int? maxLength,
}) =>
    TextFormField(
      maxLength: maxLength,
      readOnly: readOnly,
      controller: controller,
      onTap: onTap,
      textAlign: TextAlign.justify,
      decoration: InputDecoration(
        counterText: '',
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: prefixIconColor,
              )
            : null,
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black54,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(color: Colors.black54),
        ),
      ),
      maxLines: maxLines,
      validator: validator,
    );

/// build Option Buttons [Paste, Copy, Clear, Share]
Widget buildOptionButtons({
  required dynamic Function() onPressedPaste,
  required dynamic Function() onPressedCopy,
  required dynamic Function() onPressedClear,
  required dynamic Function() onPressedShare,
  bool enablePaste = true,
  bool enableCopy = true,
  bool enableClear = true,
  bool enableShare = true,
}) =>
    Column(
      children: [
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            BuildCondition(
              condition: enablePaste,
              builder: (context) => Expanded(
                child: buildTextButtonIcon(
                    height: 35,
                    width: 82.7,
                    icon: Icons.paste_outlined,
                    iconColor: Colors.blue,
                    iconSize: 14,
                    text: 'Paste',
                    textColor: Colors.blue,
                    fontSize: 14,
                    backgroundColor: Colors.grey.shade300,
                    onPressed: onPressedPaste),
              ),
              fallback: null,
            ),
            BuildCondition(
              condition: enableCopy,
              builder: (context) => const SizedBox(
                width: 10.0,
              ),
              fallback: null,
            ),
            BuildCondition(
              condition: enableCopy,
              builder: (context) => Expanded(
                child: buildTextButtonIcon(
                    height: 35,
                    width: 82.7,
                    icon: Icons.copy_outlined,
                    iconColor: Colors.green,
                    iconSize: 14,
                    text: 'Copy',
                    textColor: Colors.green,
                    fontSize: 14,
                    backgroundColor: Colors.grey.shade300,
                    onPressed: onPressedCopy),
              ),
              fallback: null,
            ),
            BuildCondition(
              condition: enableClear,
              builder: (context) => const SizedBox(
                width: 10.0,
              ),
              fallback: null,
            ),
            BuildCondition(
              condition: enableClear,
              builder: (context) => Expanded(
                child: buildTextButtonIcon(
                    height: 35,
                    width: 82.7,
                    icon: Icons.clear_outlined,
                    iconColor: Colors.red,
                    iconSize: 14,
                    text: 'Clear',
                    textColor: Colors.red,
                    fontSize: 14,
                    backgroundColor: Colors.grey.shade300,
                    onPressed: onPressedClear),
              ),
              fallback: null,
            ),
            BuildCondition(
              condition:
                  ((enableShare) && (enablePaste || enableCopy || enableClear)),
              builder: (context) => const SizedBox(
                width: 10.0,
              ),
              fallback: null,
            ),
            BuildCondition(
              condition: enableShare,
              builder: (context) => Expanded(
                child: buildTextButtonIcon(
                    height: 35,
                    width: 82.7,
                    icon: Icons.share_outlined,
                    iconColor: Colors.blue,
                    iconSize: 14,
                    text: 'Share',
                    textColor: Colors.blue,
                    fontSize: 14,
                    backgroundColor: Colors.grey.shade300,
                    onPressed: onPressedShare),
              ),
              fallback: null,
            ),
          ],
        ),
      ],
    );

Widget buildOpenButton({
  required dynamic Function() onPressedOpen,
}) =>
    Column(
      children: [
        const SizedBox(
          height: 10.0,
        ),
        Row(children: [
          Expanded(
            child: buildTextButtonIcon(
                height: 35,
                width: 82.7,
                icon: Icons.open_in_new_outlined,
                iconColor: Colors.blue,
                iconSize: 14,
                text: 'Open',
                textColor: Colors.blue,
                fontSize: 14,
                backgroundColor: Colors.grey.shade300,
                onPressed: onPressedOpen),
          ),
        ]),
      ],
    );
