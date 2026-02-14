import 'package:flutter/material.dart';
import 'package:my_apps/core/theme/app_colors.dart';
import 'package:my_apps/core/theme/app_styles.dart';
import 'package:my_apps/core/utils/app_assets.dart';
import 'package:my_apps/core/utils/suras_list.dart';
import 'package:my_apps/features/homeScreen/tabs/quranTab/sura_details_screen.dart';
import 'package:my_apps/providers/most_recent_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/shared_prefs_service.dart';
import '../../../../core/services/shared_prefs_service.dart' as shared_prefs_service;



class MostRecent extends StatefulWidget {
   MostRecent({super.key });

  @override
  State<MostRecent> createState() => _MostRecentState();
}

class _MostRecentState extends State<MostRecent> {
  late MostRecentProvider mostRecentProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostRecentProvider.getNewSuraList();
    },);
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
     mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Most Recent", style: AppStyles.bold16offWhite),
          SizedBox(height: .02 * height),
             SizedBox(
                height: .2 * height,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    int suraIndex = mostRecentProvider.mostRecentList[index];
                    return
                    Padding(

                      padding: EdgeInsets.symmetric(horizontal: .01 * width),
                      child:Container(
                        width: .7*width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.primaryColor
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: .02*width),
                          child: InkWell(
                            onTap: () {
                              shared_prefs_service.saveNewSuraList(suraIndex);
                              Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                                  arguments: suraIndex);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: .01*width,vertical: .02*height),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Text(SurasList.englishQuranSurahs[mostRecentProvider.mostRecentList[index]],style: AppStyles.bold24black,),

                                      Text(SurasList.arabicQuranSuras[mostRecentProvider.mostRecentList[index]],style: AppStyles.bold24black,),
                                      Text(SurasList.AyaNumber[mostRecentProvider.mostRecentList[index]],style: AppStyles.bold14black,),
                                    ],
                                  ),
                                ),
                                Expanded(child: Image.asset(AppAssets.mostRecentCard))
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } ,
                  scrollDirection: Axis.horizontal,
                  itemCount:mostRecentProvider.mostRecentList.length,
                  padding: EdgeInsets.symmetric(horizontal: .01 * width),
                ),
              ),
        ],
      ),
    );
  }
}
