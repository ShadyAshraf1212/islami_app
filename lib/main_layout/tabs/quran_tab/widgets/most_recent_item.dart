import 'package:flutter/material.dart';
import 'package:islami_app_c15_friday/core/resources/assets_manager.dart';
import 'package:islami_app_c15_friday/core/resources/colors_manager.dart';
import 'package:islami_app_c15_friday/core/routes_manager/routes_manager.dart';
import 'package:islami_app_c15_friday/models/sura_details_arguments.dart';
import 'package:islami_app_c15_friday/models/sura_model.dart';

class MostRecentItem extends StatelessWidget {
   MostRecentItem({super.key ,required this.suraModel });
SuraDM suraModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesManager.suraDetailsScreen,
        arguments: SuraDetailsArguments(suraModel: suraModel,)
        );
      },
      child: Container(
         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorsManager.gold,
        ),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                 suraModel.suraNameEn,
                  style: TextStyle(
                    fontSize: 24,
                    color: ColorsManager.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                 suraModel.suraNameAr,
                  style: TextStyle(
                    fontSize: 24,
                    color: ColorsManager.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                 "${suraModel.versesNumber} Verses",
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorsManager.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Image.asset(AssetsManager.mostRecentCardImage),
          ],
        ),
      ),
    );
  }
}
