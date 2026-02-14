import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_apps/core/theme/app_colors.dart';
import 'package:my_apps/core/theme/app_styles.dart';
import 'package:my_apps/core/utils/app_assets.dart';
import 'package:my_apps/core/utils/suras_list.dart';
import 'package:provider/provider.dart';

import '../../../../providers/most_recent_provider.dart';

class SuraDetailsScreen extends StatefulWidget {
   SuraDetailsScreen({super.key});
  static const String routeName = 'suraDetailsScreen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late  MostRecentProvider mostRecentProvider;
  @override
  dispose(){
    super.dispose();
    mostRecentProvider.getNewSuraList();
  }
  List<String> verses = [];

  void didChangeDependencies() {
    super.didChangeDependencies();
    final int index = ModalRoute.of(context)!.settings.arguments as int;
    if(verses.isEmpty) loadSuraFile(index);
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int index = ModalRoute.of(context)!.settings.arguments as int;
     mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(SurasList.englishQuranSurahs[index],style: AppStyles.bold20primary,),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: .03*width,vertical: .02*height),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.cornerLeft),
                Text(SurasList.arabicQuranSuras[index],style: AppStyles.bold24primary,),
                Image.asset(AppAssets.cornerRight)
              ],
            ),
          ),
          Expanded(
            child: verses.isEmpty? Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ) : ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.symmetric(vertical: .01*height,horizontal: .02*width),
                child: Center(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.primaryColor)
                    ),
                    child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(" ${verses[index]} [${index+1}]",style: AppStyles.bold20primary,textAlign: TextAlign.center,)),
                  ),
                ),
              );
            },
            itemCount: verses.length,
            ),
          )
        ],
      ) ,
    );
  }

   void loadSuraFile(int index) async {
     String fileContent = await rootBundle.loadString("assets/files/suras/${index+1}.txt");
      List<String> lines = fileContent.split("\n");
      await Future.delayed( Duration(seconds: 1));
       setState(() {
         verses = lines;
       });

   }
}
