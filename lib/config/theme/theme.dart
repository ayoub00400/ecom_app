import 'package:ecom_app/utils/constants.dart';
import 'package:flutter/material.dart';

var lightThemeData = ThemeData(
  iconTheme: const IconThemeData(color: Constants.primaryColor),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      iconColor: MaterialStateProperty.all(Constants.primaryColor),
    ),
  ),
  appBarTheme:
      const AppBarTheme(backgroundColor: Constants.primaryColor, elevation: 10),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    unselectedIconTheme: IconThemeData(color: Colors.grey.shade400),
    backgroundColor: Colors.white,
    elevation: 10,
  ),
  cardTheme: const CardTheme(elevation: 5, color: Colors.white),
  primaryColor: Constants.primaryColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Constants.primaryColor,
  ),
  useMaterial3: false,
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w500,
    ),
  ),
  primarySwatch: Constants.primaryColor,
);
