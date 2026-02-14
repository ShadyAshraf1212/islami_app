 import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/services/shared_prefs_service.dart';

class MostRecentProvider extends ChangeNotifier{
  //todo: the data will changed
  List<int> mostRecentList = [];

  //todo: get new sura list => read data
  void getNewSuraList()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //todo: ['0','1','2'] => [0,1,2]
    //todo: List<string> => List<int> => map()
    List<String> mostRecentIndicesAsString = prefs.getStringList(SharedPrefsKey.mostRecentKey) ?? [];
    mostRecentList = mostRecentIndicesAsString.map((e) => int.parse(e)).toList();
    notifyListeners();
  }

}