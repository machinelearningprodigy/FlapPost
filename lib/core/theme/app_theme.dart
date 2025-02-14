import 'package:blogging_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
class AppTheme {

  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder( //_border is a function that returns an OutlineInputBorder
        borderSide: BorderSide(
          color: color,
          width: 3, 
        ),
        borderRadius: BorderRadius.circular(10),
      );
 


  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor : AppPallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallete.backgroundColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(25),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.gradient2),
    ),
  );
}