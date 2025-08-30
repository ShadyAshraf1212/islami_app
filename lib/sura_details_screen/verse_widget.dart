import 'package:flutter/material.dart';
import 'package:islami_app_c15_friday/core/resources/colors_manager.dart';

class VerseWidget extends StatelessWidget {
  VerseWidget({super.key, required this.verse});

  String verse;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: ColorsManager.gold.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        verse,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          color: ColorsManager.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
