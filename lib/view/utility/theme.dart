import 'package:flutter/material.dart';
import 'package:flutter_news/view/utility/constant.dart';
import 'package:google_fonts/google_fonts.dart';

// Our light/Primary Theme
ThemeData themeData(BuildContext context) {
  return ThemeData(
    // primarySwatch: ,
    useMaterial3: true,
    // brightness: Brightness.light,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black, foregroundColor: Colors.white),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      // foregroundColor: Colors.black
    ),
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.grey.shade200,
    backgroundColor: const Color.fromRGBO(49, 48, 51, 0.1),
    iconTheme: const IconThemeData(color: Colors.black),
    primaryIconTheme: const IconThemeData(color: kPrimaryIconLightColor),
    highlightColor: Colors.black54,
    secondaryHeaderColor: Colors.black87,
    // textTheme: GoogleFonts.latoTextTheme().copyWith(
    //   bodyText1: const TextStyle(color: Colors.amber),
    //   bodyText2: const TextStyle(color: Colors.black),
    //   headline4: const TextStyle(
    //       color: kTitleTextLightColor,
    //       fontSize: 22,
    //       fontWeight: FontWeight.bold),
    //   headline1: const TextStyle(color: kTitleTextLightColor, fontSize: 80),
    //   headline6: const TextStyle(color: Colors.black87, fontSize: 15),
    // ),
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
    ).copyWith(secondary: Colors.black),
  );
}

// Dark Them
ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    useMaterial3: true,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white, foregroundColor: Colors.black),
    scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
    appBarTheme: const AppBarTheme(elevation: 0),
    colorScheme: const ColorScheme.dark(
        primary: Colors.black,
        secondary: kSecondaryDarkColor,
        surface: Colors.transparent),
    highlightColor: Colors.white54,
    backgroundColor: const Color.fromRGBO(151, 151, 151, 0.4),
    secondaryHeaderColor: Colors.white70,
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyText1: const TextStyle(color: kBodyTextColorDark),
      bodyText2: const TextStyle(color: kBodyTextColorDark),
      headline4: const TextStyle(
          color: kTitleTextDarkColor,
          fontSize: 22,
          fontWeight: FontWeight.bold),
      headline1: const TextStyle(
        color: kTitleTextDarkColor,
        fontSize: 80,
      ),
      headline6: const TextStyle(color: Colors.white54, fontSize: 15),
    ),
  );
}
