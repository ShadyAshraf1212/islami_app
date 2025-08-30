import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app_c15_friday/core/on_boarding/on_boarding.dart';
import 'package:islami_app_c15_friday/core/on_boarding/widget/dots_indicator.dart';
import 'package:islami_app_c15_friday/core/resources/colors_manager.dart';
import 'package:islami_app_c15_friday/core/routes_manager/routes_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/resources/assets_manager.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController pageController = PageController();
  int currentIndex=0;
  List<OnBoarding> onBoardingList= [
    OnBoarding(imagePath:AssetsManager.intro_1 , title: "Welcome To Islami App"),

    OnBoarding(imagePath:AssetsManager.intro_2 , title: "Welcome To Islami ",
        description: " We Are Very Excited To Have You In Our Community"),

    OnBoarding(imagePath:AssetsManager.intro_3 , title: "Reading The Quran ",
        description: "Read, and Your Lord is the Most Generous"),

    OnBoarding(imagePath:AssetsManager.intro_4 , title: "Bearish",
        description: "Praise the name of your Lord, The Most High"),

    OnBoarding(imagePath:AssetsManager.intro_5 , title: "Holy Quran Radio",
        description: "You can listen to the Holy Quran Radio through the application for free and easily"),
  ];

  @override
   initState(){
    pageController.addListener((){
      setState(() {
        currentIndex = pageController.page!.toInt() ;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
     pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(AssetsManager.islamiLogo,height: 171.h,),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onBoardingList.length,
                itemBuilder: (context, index) {
                  return Column(
                    spacing: 10.h,
                    children: [
                      Expanded(
                          child: Image.asset(onBoardingList[index].imagePath,
                            fit: BoxFit.cover,)),
                      Text(onBoardingList[index].title,style:TextStyle(color: ColorsManager.gold,fontSize: 30,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                      if(onBoardingList[index].description!=null)
                        Text(onBoardingList[index].description?? "",
                          style: TextStyle(color: ColorsManager.gold,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                            children: [
                                TextButton(onPressed:currentIndex !=0 ? (){
                                  pageController.animateToPage(
                                      currentIndex-1,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeIn) ;
                                } : null,
                                    child: Text(
                                      currentIndex !=0 ?
                                       "Back" :"",
                                      style: TextStyle(color: ColorsManager.gold,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.center,)) ,
                            TextButton(onPressed: () async{
                              if(currentIndex < 4){
                                pageController.animateToPage(
                                    currentIndex+1,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              }else {
                               await saveOnBoarding();
                                Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
                              }
                            },
                                child: Text(
                                  currentIndex !=4 ? "Next":"Finish",
                                  style: TextStyle(color: ColorsManager.gold,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,)),
                          ],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DotsIndicator(active: currentIndex == 0),
                              DotsIndicator(active: currentIndex == 1),
                              DotsIndicator(active: currentIndex == 2),
                              DotsIndicator(active: currentIndex == 3),
                              DotsIndicator(active: currentIndex == 4),
                            ],
                          ),
                        ],
                      )
                    ],

                  );
                },),
            )
          ],
        ),
      ),
    );
  }
 Future<void> saveOnBoarding() async{
    final prefs =await SharedPreferences.getInstance();
    await prefs.setBool("onBoarding", false);
  }
}
