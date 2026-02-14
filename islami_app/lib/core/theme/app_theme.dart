import 'package:flutter/material.dart';
import 'package:my_apps/core/theme/app_colors.dart';

class AppTheme {
 static final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.transparent,
  appBarTheme: AppBarTheme(
   centerTitle: true,
   backgroundColor: AppColors.black,
   iconTheme: IconThemeData(color: AppColors.primaryColor),
  )
  );
}