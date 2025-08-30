import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app_c15_friday/core/extension/context_extension.dart';
import 'package:islami_app_c15_friday/core/resources/assets_manager.dart';
import 'package:islami_app_c15_friday/core/resources/colors_manager.dart';
import 'package:islami_app_c15_friday/main_layout/tabs/quran_tab/widgets/most_recent_item.dart';
import 'package:islami_app_c15_friday/main_layout/tabs/quran_tab/widgets/most_recent_widget.dart';
import 'package:islami_app_c15_friday/main_layout/tabs/quran_tab/widgets/quran_item.dart';
import 'package:islami_app_c15_friday/models/sura_model.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {

  List<SuraDM> filteredList = SuraDM.suras;
  GlobalKey<MostRecentWidgetState> mostRecentKey =
      GlobalKey<MostRecentWidgetState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,

              child: Image.asset(
                AssetsManager.islamiLogo,
                alignment: Alignment.center,
              ),
            ),
            SizedBox(height: context.screenHeight * 0.02),
            TextField(
              onChanged: (input) {
                filterSurasBySearchKey(input);
              },
              style: TextStyle(fontSize: 18, color: ColorsManager.ofWhite),
              decoration: InputDecoration(
                prefixIcon: ImageIcon(
                  color: ColorsManager.gold,
                  AssetImage(AssetsManager.quranIcon),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: ColorsManager.gold, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorsManager.gold, width: 1),
                ),
                labelText: "sura name",
                labelStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorsManager.ofWhite,
                ),
              ),
            ),
            SizedBox(height: context.screenHeight * 0.02),
            MostRecentWidget(key: mostRecentKey),
            // Text("Sura List", style: Theme.of(context).textTheme.labelSmall),
            //
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder:
                  (context, index) => Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 64, vertical: 10),
                  ),
              itemBuilder: (context, index) {
                return QuranItem(
                  mostRecentKey: mostRecentKey,
                  suraModel: filteredList[index],
                  index: index,
                );
              },
              itemCount: filteredList.length,
            ),
          ],
        ),
      ),
    );
  }

  void filterSurasBySearchKey(String searchKey) {
    filteredList =
        SuraDM.suras
            .where(
              (element) =>
                  element.suraNameEn.toLowerCase().contains(searchKey.toLowerCase()) ||
                  element.suraNameAr.contains(searchKey)|| element.suraIndex.contains(searchKey),
            )
            .toList();
    setState(() {

    });
    print(filteredList.length);
  }
}
