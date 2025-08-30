import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app_c15_friday/core/resources/assets_manager.dart';
import 'package:islami_app_c15_friday/main_layout/tabs/hadith_tab/widgets/hadith_item.dart';

class Hadith extends StatelessWidget {
  const Hadith({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AssetsManager.hadithTabBg)),
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(AssetsManager.islamiLogo)),
          Expanded(
            flex: 4,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                enlargeCenterPage: true,
                autoPlay: false,
              ),
              items:
                  List.generate(50, (index) => HadithItem(index: index + 1)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
