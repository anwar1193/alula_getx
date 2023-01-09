import 'package:flutter/material.dart';

const appPurple = Color(0xFFa39ed6);
const appRed = Color(0xFFf72c2c);
const appWhite = Color(0xFFfcf9f9);
const appGreen = Color(0xFF52ce54);

ThemeData light = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: appPurple,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: appPurple),
  ),
);
