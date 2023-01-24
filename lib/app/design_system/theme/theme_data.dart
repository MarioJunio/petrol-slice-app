import 'package:flutter/material.dart';
import 'package:petrol_slice/app/design_system/theme/cc_colors.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    primarySwatch: Colors.blue,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        fixedSize: const Size.fromHeight(45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(elevation: 0),
    textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w400,
          color: CCColors.black,
        ),
        headline2: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: CCColors.neutralN1,
        ),
        subtitle1: TextStyle(
          fontWeight: FontWeight.w600,
          color: CCColors.neutralN2,
          fontSize: 14,
        ),
        caption: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: CCColors.neutralN2,
        ),
        bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        bodyText2: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
        button: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontSize: 20,
        )),
  );
}
