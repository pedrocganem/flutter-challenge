import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTheme {
  ThemeData lightThemeData() {
    final _fontFamily = GoogleFonts.nunito().fontFamily;
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
          elevation: 0,
          color: AppColors.appLightAppBarColor,
          brightness: Brightness.dark),
      primaryColor: AppColors.appLightPrimaryColor,
      accentColor: AppColors.appLightAccentColor,
      scaffoldBackgroundColor: AppColors.appLightScaffoldBackgroundColor,
      buttonColor: AppColors.appLightButtonColor,
      snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColors.appLightSnackbarColor,
          contentTextStyle: TextStyle(
            color: AppColors.appLightTextSecondaryColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: _fontFamily,
          )),
      textTheme: TextTheme(
        //AppBar title style
        headline1: TextStyle(
          color: AppColors.appLightSecondaryColor,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),

        //Question Card Title style
        headline2: TextStyle(
          color: AppColors.appLightPrimaryColor,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),

        //Question card content
        headline3: TextStyle(
          color: AppColors.appLightTextThirdColor,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.normal,
          fontSize: 22,
        ),
        
        //TextFormField input style
        headline4: TextStyle(
          color: AppColors.appLightPrimaryColor,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.normal,
          fontSize: 14
        ),

        //Button text style
        button: TextStyle(
          color: AppColors.appLightAccentColor,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),

        //TextFormField hintText textStyle
        overline: TextStyle(
          color: AppColors.appLightSecondaryColor,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 14
        ),

        //TextFormField label textStyle
        subtitle1: TextStyle(
          color: AppColors.appLightTextFormFieldLabelColor,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),

        //AddQuestion color subtitle
        subtitle2: TextStyle(
          color: AppColors.appLightTextFormFieldLabelColor,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        )
      ),
    );
  }
}
