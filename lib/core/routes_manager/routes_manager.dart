import 'package:flutter/cupertino.dart';
import 'package:islami_app_c15_friday/main_layout/main_layout.dart';
import 'package:islami_app_c15_friday/models/on_boarding.dart';

import 'package:islami_app_c15_friday/splash/splash.dart';
import 'package:islami_app_c15_friday/sura_details_screen/sura_details_screen.dart';

class RoutesManager {
  static const String splash = "/splash";
  static const String mainLayout = "/mainLayout";
  static const String suraDetailsScreen = "/suraDetails";
  static const String onBoardingPage ="/OnBoardingPage";

  static Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return CupertinoPageRoute(builder: (context) => Splash());
      case mainLayout:
        return CupertinoPageRoute(builder: (context) => MainLayout());
        case onBoardingPage:
        return CupertinoPageRoute(builder: (context) => OnBoardingPage());
      case suraDetailsScreen:
        return CupertinoPageRoute(builder: (context) => SuraDetailScreen(), settings: settings);
    }
  }
}
