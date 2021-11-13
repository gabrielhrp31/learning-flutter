import 'dart:collection';

import 'package:cadastrat_usuarios/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme { //1
    return ThemeData( //2
        primaryColor:CustomColors.primary,
        appBarTheme: AppBarTheme(
          backgroundColor: CustomColors.primary
        ),
        scaffoldBackgroundColor: CustomColors.backgroundLight,
        fontFamily: 'Montserrat', //3
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
              color: CustomColors.hintLight
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.primary, width: 1)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.primary, width:2)
          ),
          labelStyle: TextStyle(
              color: CustomColors.primary
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData( // 4
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                )
            ),
            backgroundColor:MaterialStateProperty.all(CustomColors.primary),
          )
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
              color: CustomColors.primary,
              fontSize:16.0,
              fontWeight: FontWeight.bold
          ),
          button: TextStyle(color: Colors.white)
        ),
    );
  }
}