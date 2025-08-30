import 'package:islami_app_c15_friday/core/resources/constant_manager.dart';
import 'package:islami_app_c15_friday/models/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static void saveSuraIndex(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentSurasIndex =
        prefs.getStringList(CacheConstant.mostRecentSurasKey) ?? [];
    if(mostRecentSurasIndex.contains("$index")){
      mostRecentSurasIndex.remove("$index");
    }
    if(mostRecentSurasIndex.length > 6){
      mostRecentSurasIndex.remove(mostRecentSurasIndex.first);
    }

    mostRecentSurasIndex.add("$index");

    prefs.setStringList(CacheConstant.mostRecentSurasKey, mostRecentSurasIndex);
    print("Length: ${mostRecentSurasIndex.length}");
  }

  static Future<List<SuraDM>>  getMostRecentSuras() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> mostRecentSuasIndex =  /// [ "1", "2"]
        prefs.getStringList(CacheConstant.mostRecentSurasKey) ?? [];
    List<SuraDM> surasList = [];
    for (int i = 0; i < mostRecentSuasIndex.length; i++) {
      int index = int.parse(mostRecentSuasIndex[i]);
      surasList.add(SuraDM.suras[index-1]);
    }

    return surasList.reversed.toList();
  }
}
