import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    hintColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    dividerColor: Colors.grey,
    textTheme: const TextTheme(
      displayMedium: TextStyle(fontSize: 42, color: Colors.blueGrey),
      titleMedium: TextStyle(fontSize: 24, color: Colors.blue),
      bodyMedium:  TextStyle(fontSize: 14, color: Colors.black),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.blue[300],
      textTheme: ButtonTextTheme.primary,
    ),
    // 其他主题配置...
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey[900],
    hintColor: Colors.blueGrey[700],
    scaffoldBackgroundColor: Colors.grey[850],
    cardColor: Colors.grey[800],
    dividerColor: Colors.white,
    textTheme: TextTheme(
      displayMedium: TextStyle(fontSize: 42, color: Colors.blueGrey[200]),
      titleMedium: TextStyle(fontSize: 24, color: Colors.blueGrey[100]),
      bodyMedium: const TextStyle(fontSize: 14, color: Colors.white),
    ),

    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blueGrey[700],
      disabledColor: Colors.blueGrey[400],
      textTheme: ButtonTextTheme.primary,
    ),
  
  );

}