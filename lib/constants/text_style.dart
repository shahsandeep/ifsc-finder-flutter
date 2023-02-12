import 'package:flutter/material.dart';

TextStyle myText(
    {double fontSize = 16,
    Color textColor = Colors.black,
    FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize,
    color: textColor,
    fontWeight: fontWeight,
  );
}
