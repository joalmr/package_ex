import 'package:package_ejemplo/src/style/styles.dart';
import 'package:flutter/material.dart';

Widget buttonSecondary(
    {required Function() onPressed, required text, Size? minimumSize}) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      alignment: Alignment.center,
      primary: bluePacifico,
      side: BorderSide(color: bluePacifico),
      minimumSize: minimumSize,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
    child: Text(text),
  );
}
