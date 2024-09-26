import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solar/core/theming/font_styles.dart';

ThemeData appThemeData() => ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyles.font20WhiteBold,
      iconTheme: IconThemeData(color: Colors.white),
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.grey),
      backgroundColor: Colors.blue,
    ),
    scaffoldBackgroundColor: Colors.white
    // const Color(
    //   0xffede5d9,
    // ),
    );
