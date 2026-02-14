import 'package:flutter/material.dart';
import 'package:my_apps/core/theme/app_colors.dart';
import 'package:my_apps/features/homeScreen/tabs/quranTab/sura_details_screen.dart';
import 'package:my_apps/features/homeScreen/tabs/quranTab/sura_list_item.dart';
import 'package:my_apps/core/utils/suras_list.dart';
import 'package:my_apps/features/homeScreen/tabs/quranTab/most_recent.dart';

import '../../../../core/services/shared_prefs_service.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/utils/app_assets.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  static String routeName = 'quranTab';

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
List<int> filterList =List.generate(114, (index) => index,);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: .04 * width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //todo: search
            SizedBox(
              width: .9 * width,
              height: .07 * height,
              child:
              TextField(
                onChanged: (newText) {
                  SerchByNewText(newText);
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
            ),


            SizedBox(height: .02 * height),


            //todo: most recent



                    MostRecent()

            ,

            SizedBox(height: .02 * height),


            //todo: sura list
            Text("Sura List", style: AppStyles.bold16offWhite),
            SizedBox(height: .02 * height),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: .01 * width,
                    vertical: .008 * height,
                  ),
                  child: InkWell(
                    onTap: () {
                      saveNewSuraList(filterList[index]);
                      Navigator.pushNamed(context,
                          SuraDetailsScreen.routeName,
                          arguments: filterList[index]);
                    },

                      child: SuraListItem(
                        index: filterList[index],)),
                ),
                separatorBuilder: (context, index) => Divider(
                  height: .04 * height,
                  color: AppColors.white,
                  thickness: 1,
                  indent: .1 * width,
                  endIndent: .08 * width,
                ),
                itemCount: filterList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

 void SerchByNewText(String newText) {
  List<int>filterSearchList =[];
  for(int i=0;i<SurasList.englishQuranSurahs.length;i++){
    if(SurasList.englishQuranSurahs[i].toLowerCase().contains(newText.toLowerCase())){
      filterSearchList.add(i);
    }else if(SurasList.arabicQuranSuras[i].contains(newText)){
      filterSearchList.add(i);
    }
  }
  filterList = filterSearchList;
  setState(() {

  });
}

}
