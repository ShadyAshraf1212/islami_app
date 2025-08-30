import 'package:flutter/material.dart';
import 'package:islami_app_c15_friday/core/prefs_manager/prefs_manager.dart';
import 'package:islami_app_c15_friday/core/resources/colors_manager.dart';
import 'package:islami_app_c15_friday/main_layout/tabs/quran_tab/widgets/most_recent_item.dart';
import 'package:islami_app_c15_friday/models/sura_model.dart';

class MostRecentWidget extends StatefulWidget {
   MostRecentWidget({super.key, });

  @override
  State<MostRecentWidget> createState() => MostRecentWidgetState();
}

class MostRecentWidgetState extends State<MostRecentWidget> {
  List<SuraDM> mostRecentSuras = [];

  refreshMostRecent()async{
   mostRecentSuras = await  PrefsManager.getMostRecentSuras();
   setState(() {

   });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshMostRecent();

  }
  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.2,
        child: mostRecentSuras.isEmpty ? Center(child: Text("No Most Recent...", style: TextStyle(fontSize: 18, color: ColorsManager.gold, fontWeight: FontWeight.bold),)):ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 5),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => MostRecentItem(suraModel: mostRecentSuras[index],),
          itemCount: mostRecentSuras.length,
        ),
      );
  }
}
