import 'package:flutter/material.dart';
import 'package:islami_app_c15_friday/islami_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs =await SharedPreferences.getInstance();
  final bool showOnBoarding = prefs.getBool("onBoarding") ?? true;

  runApp( QuranApp(showOnBoarding: showOnBoarding,));
}

