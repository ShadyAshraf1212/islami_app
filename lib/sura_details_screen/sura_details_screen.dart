import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_c15_friday/core/resources/assets_manager.dart';
import 'package:islami_app_c15_friday/core/resources/colors_manager.dart';
import 'package:islami_app_c15_friday/models/sura_details_arguments.dart';
import 'package:islami_app_c15_friday/sura_details_screen/verse_widget.dart';

class SuraDetailScreen extends StatefulWidget {
  SuraDetailScreen({super.key});

  @override
  State<SuraDetailScreen> createState() => _SuraDetailScreenState();
}

class _SuraDetailScreenState extends State<SuraDetailScreen> {
  List<String> verses = [];
  late SuraDetailsArguments arguments;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    arguments =
    ModalRoute.of(context)!.settings.arguments as SuraDetailsArguments;
    loadSuraContent(int.parse(arguments.suraModel.suraIndex));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    /// access on state of mostRecent to call -> refresh
    arguments.mostRecentKey?.currentState?.refreshMostRecent();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(arguments.suraModel.suraNameEn)),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AssetsManager.quranDetailsPatternLeft),
                    Image.asset(AssetsManager.quranDetailsPatternRight),
                  ],
                ),
                Text(
                  arguments.suraModel.suraNameAr,
                  style: TextStyle(fontSize: 22, color: ColorsManager.gold),
                ),
              ],
            ),
            Expanded(
              child:
                  verses.isEmpty
                      ? Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.gold,
                        ),
                      )
                      : ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 12,),
                        itemBuilder: (context, index) => VerseWidget(verse: verses[index]),
                        itemCount: verses.length,
                      ),
            ),
          ],
        ),
      ),
    );
  }

  void loadSuraContent(int index) async {
    String filePath = "assets/files/suras/$index.txt";
    String fileContent = await rootBundle.loadString(filePath); // 2 mins
    List<String> suraLines = fileContent.trim().split("\n");
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += "[${i + 1}]";
    }
    verses = suraLines;
    setState(() {});
  }
}
