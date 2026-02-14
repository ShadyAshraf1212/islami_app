import 'package:flutter/material.dart';
import 'package:my_apps/core/utils/app_assets.dart';
import 'package:my_apps/features/homeScreen/tabs/hadethTab/hadeth_tab.dart';
import 'package:my_apps/features/homeScreen/tabs/quranTab/quran_tab.dart';
import 'package:my_apps/features/homeScreen/tabs/radioTab/radio_tab.dart';
import 'package:my_apps/features/homeScreen/tabs/sebhaTab/sebha_tab.dart';
import 'package:my_apps/features/homeScreen/tabs/timeTab/time_tab.dart';

import '../../core/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  static String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> pages = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  List<String> images = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          images[selectedIndex],
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.white,
            unselectedItemColor: AppColors.black60Opacity,
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.primaryColor,
            items: [
              BottomNavigationBarItem(
                icon: buildNavIcon(selectedIndex, 0, AppAssets.quranIcon),
                label: 'Quran',
              ),
              BottomNavigationBarItem(
                icon: buildNavIcon(selectedIndex, 1, AppAssets.hadethIcon),
                label: 'Hadeth',
              ),
              BottomNavigationBarItem(
                icon: buildNavIcon(selectedIndex, 2, AppAssets.sebhaIcon),
                label: 'Sebha',
              ),
              BottomNavigationBarItem(
                icon: buildNavIcon(selectedIndex, 3, AppAssets.radioIcon),
                label: 'Radio',
              ),
              BottomNavigationBarItem(
                icon: buildNavIcon(selectedIndex, 4, AppAssets.timeIcon),
                label: 'Time',
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.islamiLogo),
              Expanded(child: pages[selectedIndex]),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildNavIcon(int currentIndex, int selectedIndex, String imagePath) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if (currentIndex == selectedIndex) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: .06 * width,
          vertical: .01 * height,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(66),
          color: AppColors.black60Opacity,
        ),
        child: Image.asset(imagePath, color: AppColors.white),
      );
    } else {
      return Image.asset(imagePath);
    }
  }
}
