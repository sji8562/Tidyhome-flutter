import 'package:flutter/material.dart';
import 'color.dart';

// Color(0XFF2D403AFF)

ThemeData theme() {
  return ThemeData(
    primarySwatch: kPrimaryColor,
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.white,
      elevation: 1.0,
    ),
  );
}