import 'package:flutter/material.dart';

enum AppTheme { darkTheme, lightTheme }

final appThemeData = {
  AppTheme.darkTheme: ThemeData(
    appBarTheme:  AppBarTheme(backgroundColor: Colors.red[900]),
    brightness: Brightness.dark,
    primaryColor: Colors.blue[780],
  ),
  AppTheme.lightTheme: ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  )
};