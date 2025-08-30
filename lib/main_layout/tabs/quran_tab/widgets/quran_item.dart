import 'package:flutter/material.dart';
import 'package:islami_app_c15_friday/core/prefs_manager/prefs_manager.dart';
import 'package:islami_app_c15_friday/core/resources/assets_manager.dart';
import 'package:islami_app_c15_friday/core/resources/constant_manager.dart';
import 'package:islami_app_c15_friday/core/routes_manager/routes_manager.dart';
import 'package:islami_app_c15_friday/main_layout/tabs/quran_tab/widgets/most_recent_widget.dart';
import 'package:islami_app_c15_friday/models/sura_details_arguments.dart';
import 'package:islami_app_c15_friday/models/sura_model.dart';

class QuranItem extends StatelessWidget {
   QuranItem({super.key, required this.suraModel, required this.index, required this.mostRecentKey});
  SuraDM suraModel;
  int index;
  GlobalKey<MostRecentWidgetState> mostRecentKey;



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        int index = int.parse(suraModel.suraIndex);
        PrefsManager.saveSuraIndex(index);
        Navigator.pushNamed(context, RoutesManager.suraDetailsScreen,
            arguments: SuraDetailsArguments(suraModel: suraModel, mostRecentKey: mostRecentKey));
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AssetsManager.suraNumBg),
              Text("${suraModel.suraIndex}", style: TextStyle(color: Colors.white),)
            ],
          ),
          SizedBox(width: 12,),
          Column(
            children: [
              Text(suraModel.suraNameEn, style: TextStyle(color: Colors.white),),
              Text(suraModel.versesNumber.toString(), style: TextStyle(color: Colors.white),),
            ],
          ),
          Spacer(),
          Text(suraModel.suraNameAr, style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}



