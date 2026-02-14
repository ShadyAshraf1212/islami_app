import 'package:flutter/material.dart';
import 'package:my_apps/core/utils/suras_list.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../../core/utils/app_assets.dart';

class SuraListItem extends StatelessWidget {
  int index;
   SuraListItem({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppAssets.starNum,
              fit: BoxFit.fill,
              width: 56,
              height: 56,
            ),
            Text("${index + 1}", style: AppStyles.bold20White),
          ],
        ),
        SizedBox(width: .04 * width),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              SurasList.englishQuranSurahs[index],
              style: AppStyles.bold20White,
            ),
            Text(
              "${SurasList.AyaNumber[index]} Verses",
              style: AppStyles.bold14White,
            ),
          ],
        ),
        const Spacer(),
        Text(
          SurasList.arabicQuranSuras[index],
          style: AppStyles.bold20White,
        ),
      ],
    );
  }
}
