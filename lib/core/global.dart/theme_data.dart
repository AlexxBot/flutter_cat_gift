import 'package:flutter/material.dart';

const primaryColor = Colors.brown;
const secondaryColor = Colors.brown;
final backgroundColor = Colors.grey[300];
final errorColor = Colors.red[900];

ThemeData customizedTheme = ThemeData(
    fontFamily: 'Sora',
    primaryColor: primaryColor,
    primarySwatch: secondaryColor,
    backgroundColor: backgroundColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
        elevation: 5, backgroundColor: secondaryColor, centerTitle: true));
