import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appThemeData() => ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.grey),
        backgroundColor: Colors.blue,
      ),
      scaffoldBackgroundColor: const Color(
        0xffede5d9,
      ),
    );
