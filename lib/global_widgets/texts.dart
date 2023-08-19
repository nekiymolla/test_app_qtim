import 'package:flutter/material.dart';

Widget headerText(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget subtitleText(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 18,
    ),
  );
}
