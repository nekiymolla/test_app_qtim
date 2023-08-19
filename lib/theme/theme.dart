import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        elevation: 0, backgroundColor: Color.fromARGB(255, 27, 155, 240)),
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 255, 214, 50)),
    useMaterial3: true,
    dividerColor: Colors.white24);
