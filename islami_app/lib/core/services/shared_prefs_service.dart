import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKey{
  static const String mostRecentKey = 'most_recent';
}
//todo: save new sura list
void saveNewSuraList(int newIndex)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //todo: get all sura list from shared pref
  List<String>mostRecentIndicesList = prefs.getStringList(SharedPrefsKey.mostRecentKey) ?? [];
  //todo:add sura index in sura list in shared pref
  if(mostRecentIndicesList.contains('$newIndex')){
    mostRecentIndicesList.remove('$newIndex');
    mostRecentIndicesList.insert(0,'$newIndex');
  }
  else{
    mostRecentIndicesList.insert(0,'$newIndex');
  }
  if(mostRecentIndicesList.length>5){
    mostRecentIndicesList.removeLast();
  }

  await prefs.setStringList(SharedPrefsKey.mostRecentKey, mostRecentIndicesList);
}
