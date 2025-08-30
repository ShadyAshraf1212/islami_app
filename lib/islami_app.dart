import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app_c15_friday/core/config/theme/theme_manager.dart';
import 'package:islami_app_c15_friday/core/routes_manager/routes_manager.dart';
import 'package:islami_app_c15_friday/splash/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranApp extends StatelessWidget {
  final bool showOnBoarding;
  QuranApp({super.key,required this.showOnBoarding});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 862),
     minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>MaterialApp(
        onGenerateRoute:RoutesManager.getRoute,
        initialRoute:showOnBoarding? RoutesManager.onBoardingPage : RoutesManager.mainLayout,
        theme: ThemeManager.light,
        themeMode: ThemeMode.light,


      ),

    );
  }
}
