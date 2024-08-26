// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyTextStyle {
  TextStyle myTextStyle(
      {required Color color,
      required double size,
      required FontWeight fontsize}) {
    return TextStyle(color: color, fontSize: size, fontWeight: fontsize);
  }
}
