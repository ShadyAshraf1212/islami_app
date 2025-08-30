import 'package:flutter/material.dart';
import 'package:islami_app_c15_friday/core/resources/assets_manager.dart';
import 'package:islami_app_c15_friday/core/resources/colors_manager.dart';
import 'package:islami_app_c15_friday/main_layout/tabs/hadith_tab/hadith.dart';
import 'package:islami_app_c15_friday/main_layout/tabs/quran_tab/quran_tab.dart';
import 'package:islami_app_c15_friday/main_layout/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami_app_c15_friday/main_layout/tabs/radio_tab/radio_tab.dart'
    as radio_tab;
import 'package:islami_app_c15_friday/main_layout/tabs/time_tab/time_tab.dart';

class MainLayout extends StatefulWidget {
  MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> tabs = [Quran(), Hadith(), Sebha(), radio_tab.Radio(), Time()];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  void _onTab(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: _onTab,

      items: [
        BottomNavigationBarItem(
          icon: _buildIconWidget(
            AssetsManager.quranIcon,
            isSelected: selectedIndex == 0,
          ),
          label: "Quran",
        ),
        BottomNavigationBarItem(
          icon: _buildIconWidget(
            AssetsManager.hadithIcon,
            isSelected: selectedIndex == 1,
          ),
          label: "Hadith",
        ),
        BottomNavigationBarItem(
          icon: _buildIconWidget(
            AssetsManager.sebhaIcon,
            isSelected: selectedIndex == 2,
          ),
          label: "Sebha",
        ),
        BottomNavigationBarItem(
          icon: _buildIconWidget(
            AssetsManager.radioIcon,
            isSelected: selectedIndex == 3,
          ),
          label: "Radio",
        ),
        BottomNavigationBarItem(
          icon: _buildIconWidget(
            AssetsManager.timeIcon,
            isSelected: selectedIndex == 4,
          ),
          label: "Time",
        ),
      ],
    );
  }

  Widget _buildIconWidget(String iconPath, {required bool isSelected}) {
    return isSelected
        ? Container(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
          decoration: BoxDecoration(
            color: ColorsManager.black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(66),
          ),
          child: ImageIcon(AssetImage(iconPath)),
        )
        : ImageIcon(AssetImage(iconPath));
  }
}
