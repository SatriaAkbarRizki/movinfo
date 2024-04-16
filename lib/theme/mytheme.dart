import 'package:flutter/material.dart';

class MyTheme {
  get lightTheme => ThemeData(
      scaffoldBackgroundColor: const Color(0xfff8f9fb),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xfff8f9fb),
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 24,
              letterSpacing: 1.5,
              fontFamily: 'Abrill')),
      textTheme: const TextTheme(
          bodySmall: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Questrial',
              fontWeight: FontWeight.w500),
          titleSmall: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Questrial',
              fontWeight: FontWeight.w600),
          titleMedium: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
          labelSmall: TextStyle(
            fontFamily: 'Abrill',
            fontSize: 18,
            letterSpacing: 1.2,
          )),
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
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      cardTheme: CardTheme(
        color: const Color(0xff5d8274),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ));

  get darkTheme => ThemeData(
      scaffoldBackgroundColor: const Color(0xff252525),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff252525),
          titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 24,
              letterSpacing: 1.5,
              fontFamily: 'Abrill')),
      textTheme: const TextTheme(
        bodySmall: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Questrial',
            fontWeight: FontWeight.w500),
        titleSmall: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Questrial',
            fontWeight: FontWeight.w600),
        titleMedium: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
        labelSmall: TextStyle(
            fontFamily: 'Abrill',
            fontSize: 18,
            letterSpacing: 1.2,
            color: Colors.white),
      ),
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
          hintStyle: const TextStyle(color: Colors.white),
          labelStyle: const TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      cardTheme: CardTheme(
        color: const Color(0xff5d8274),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ));
}
