import 'package:flutter/material.dart';
import 'package:package_ejemplo/src/style/styles.dart';

Widget buttonPrimary(
    {required Function()? onPressed, required String text, Size? minimumSize}) {
  return TextButton(
    child: Text(text),
    onPressed: onPressed,
    style: TextButton.styleFrom(
      alignment: Alignment.center,
      primary: Colors.white,
      backgroundColor: greenPacifico,
      side: BorderSide(color: greenPacifico),
      minimumSize: minimumSize,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
  );
}
