import 'package:flutter/cupertino.dart';
import 'package:islami_app_c15_friday/main_layout/tabs/quran_tab/widgets/most_recent_widget.dart';
import 'package:islami_app_c15_friday/models/sura_model.dart';

class SuraDetailsArguments{
  SuraDM suraModel;

  GlobalKey<MostRecentWidgetState>? mostRecentKey;
  SuraDetailsArguments({required this.suraModel,  this.mostRecentKey});
}