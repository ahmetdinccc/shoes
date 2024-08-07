import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20)),
    colorScheme: ColorScheme.light(
        background: Colors.grey[300]!,
        primary: const Color.fromARGB(255, 124, 124, 124),
        secondary: Colors.grey[300]!));
