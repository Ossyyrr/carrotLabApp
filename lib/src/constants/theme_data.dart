import 'package:flutter/material.dart';

bool isSmallDevice(MediaQueryData mediaQuery) => mediaQuery.size.width < 341;
bool isMobileDevice(MediaQueryData mediaQuery) => mediaQuery.size.width < 481;

ThemeData themeDataApp() {
  return ThemeData(
    fontFamily: 'Montserrat',
    primaryColor: const Color(0xFF22feed), //f2feda
    primaryColorDark: const Color(0xFF00096e),
    accentColor: const Color(0xFFfe22a1),
    errorColor: const Color(0xFFfe22a1),
    disabledColor: const Color(0xffA0A0A0),
    textTheme: _textThemeData,
    primarySwatch: const MaterialColor(
      0xFFfe22a1,
      const <int, Color>{
        50: const Color(0xFFfe84cb),
        100: const Color(0xFFfe70c2),
        200: const Color(0xFFfe5dba),
        300: const Color(0xFFfe49b2),
        400: const Color(0xFFfe36a9),
        500: const Color(0xFFfe22a1),
        600: const Color(0xFFfe0e99),
        700: const Color(0xFFf8018f),
        800: const Color(0xFFe40184),
        900: const Color(0xFFd10179),
      },
    ),
    primaryTextTheme: TextTheme(
      headline6: TextStyle(fontSize: 20, color: Colors.white),
    ),
  );
}

TextTheme get _textThemeData => TextTheme(
      button: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
      ),
    );
