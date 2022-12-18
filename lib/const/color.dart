import 'package:flutter/material.dart';

const appPurple = Color(0xFFa39ed6);

ThemeData light = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: appPurple,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: appPurple),
  ),
);
