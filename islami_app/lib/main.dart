import 'package:flutter/material.dart';
import 'package:my_apps/core/theme/app_theme.dart';
import 'package:my_apps/features/homeScreen/home_screen.dart';
import 'package:my_apps/features/homeScreen/tabs/hadethTab/hadeth_tab.dart';
import 'package:my_apps/features/homeScreen/tabs/quranTab/quran_tab.dart';
import 'package:my_apps/features/homeScreen/tabs/radioTab/radio_tab.dart';
import 'package:my_apps/features/homeScreen/tabs/sebhaTab/sebha_tab.dart';

import 'features/homeScreen/tabs/timeTab/time_tab.dart';

void main() {
  runApp( IslamiApp());
}
class IslamiApp extends StatelessWidget {
  IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: QuranTab.routeName,
      routes:{
        HomeScreen.routeName:(_)=>HomeScreen(),
        QuranTab.routeName:(_)=>QuranTab(),
        HadethTab.routeName:(_)=>HadethTab(),
        RadioTab.routeName: (_)=>RadioTab(),
        SebhaTab.routeName:(_)=>SebhaTab(),
        TimeTab.routeName:(_)=>TimeTab(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}


