import 'package:flutter/material.dart';
import 'package:package_ejemplo/src/theme/colors.dart';

Widget buttonSecondary(
    {required Function()? onPressed, required text, Size? minimumSize}) {
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
