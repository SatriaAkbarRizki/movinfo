import 'package:flutter/material.dart';

class MyTheme {
  get lightTheme => ThemeData(
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 24,
              letterSpacing: 1.5,
              fontFamily: 'Abrill')),
      textTheme: const TextTheme(
          titleSmall: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Questrial',
              fontWeight: FontWeight.w600),
          titleMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              elevation: const MaterialStatePropertyAll(3),
              shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              foregroundColor: const MaterialStatePropertyAll(Colors.white),
              backgroundColor:
                  const MaterialStatePropertyAll(Color(0xff5d8274)))),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff193d3d),
        selectedItemColor: Colors.orange[400],
        unselectedItemColor: Colors.grey[400],
      ),
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))));
}
