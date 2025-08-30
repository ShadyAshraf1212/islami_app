import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_c15_friday/core/resources/assets_manager.dart';
import 'package:islami_app_c15_friday/core/resources/colors_manager.dart';
import 'package:islami_app_c15_friday/main_layout/tabs/hadith_tab/hadith.dart';
import 'package:islami_app_c15_friday/models/hadith_model.dart';

class HadithItem extends StatefulWidget {
  HadithItem({super.key, required this.index});

  int index;

  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
  HadithModel? hadithModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadHadithFile();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AssetsManager.hadithCardBg)),
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AssetsManager.quranDetailsPatternLeft,
                    color: Colors.black,
                  ),
                  Image.asset(
                    AssetsManager.quranDetailsPatternRight,
                    color: Colors.black,
                  ),
                ],
              ),
              hadithModel == null
                  ? Center(child: CircularProgressIndicator())
                  : Text(
                    hadithModel!.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
            ],
          ),
          hadithModel == null
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    hadithModel!.content,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
        ],
      ),
    );
  }

  void loadHadithFile() {
    String filePath = "assets/files/hadith/h${widget.index}.txt";
    String fileContent = "";
    rootBundle.loadString(filePath).then((result) {
      print("ana da5lt . then");
      fileContent = result;
      List<String> hadithLines = fileContent.split("\n");
      String title = hadithLines[0];
      hadithLines.removeAt(0);
      String content = hadithLines.join();
      hadithModel = HadithModel(title: title, content: content);
      setState(() {});
    });
  }
}
