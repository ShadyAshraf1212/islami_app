import 'package:flutter/material.dart';
import 'package:islami_app_c15_friday/core/resources/colors_manager.dart';

class ThemeManager{
  static  ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.black,
      foregroundColor: ColorsManager.gold,
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 20, color: ColorsManager.gold, fontWeight: FontWeight.w500)
    ),
    primaryColor: Colors.red,
    scaffoldBackgroundColor: ColorsManager.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.gold,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManager.white,
      unselectedItemColor: ColorsManager.black,

    ),
    textTheme: TextTheme(
      labelSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ColorsManager.ofWhite)
    )
  );


}