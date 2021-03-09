import 'package:flutter/material.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.purple,
        backgroundColor: Colors.white,
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black))),
    AppTheme.darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.purple,
        backgroundColor: Colors.black12,
        textTheme: TextTheme(
            headline6: TextStyle(color: Colors.white),
            headline1: TextStyle(color: Colors.white),
            headline2: TextStyle(color: Colors.white),
            headline3: TextStyle(color: Colors.white),
            headline4: TextStyle(color: Colors.white),
            headline5: TextStyle(color: Colors.white),
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white))),
  };
}

enum AppTheme { lightTheme, darkTheme }
