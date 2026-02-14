import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/utils/app_assets.dart';

class SearchTextField extends StatelessWidget {
  final VoidCallback SerchByNewText;
   SearchTextField({super.key, required this.SerchByNewText});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: .9 * width,
      height: .07 * height,
      child:
      TextField(
        onChanged: (newText) {
          SerchByNewText();
        },
        cursorColor: AppColors.primaryColor,
        style: AppStyles.bold16offWhite,
        decoration: InputDecoration(
          hintText: "Sura Name",
          hintStyle: AppStyles.bold16offWhite,
          prefixIcon: Image.asset(
            AppAssets.quranIcon,
            color: AppColors.primaryColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
              width: .004 * width,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
              width: .003 * width,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
              width: .004 * width,
            ),
          ),
        ),
      ),
    );
  }
}
