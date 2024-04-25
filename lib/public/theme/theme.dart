import 'package:flutter/material.dart';
import 'package:medinas_app/public/theme/colors.dart';

ThemeData MedinasTheme() {
  return ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: Colors.deepPurple,
      secondary: Colors.amber,
      surface: Colors.white,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onError: Colors.white,
    ),
    useMaterial3: true,
    fontFamily: 'Roboto',
    textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: primary,
        )),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.deepPurple,
      textTheme: ButtonTextTheme.primary,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.deepPurple,
      elevation: 4,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepPurple,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepPurple,
        ),
      ),
    ),
  );
}
