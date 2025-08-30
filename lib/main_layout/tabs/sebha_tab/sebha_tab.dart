import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app_c15_friday/core/resources/assets_manager.dart';
import 'package:islami_app_c15_friday/core/resources/colors_manager.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  List<String> tasbeh=[
  "سبحان الله",
  "الحمد لله",
  "لا إله إلا الله",
  ];
  int counter =0;
  int currentIndex =0;
  double angle =1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AssetsManager.sebhaBg,))
      ),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AssetsManager.islamiLogo,height: 171.h,),
          Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            style: TextStyle(fontWeight:FontWeight.w500,fontSize: 30 , color: ColorsManager.white, ),
            textAlign: TextAlign.center,),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(AssetsManager.sebhaTop,height: 80.h,),
              Padding(
                padding:  EdgeInsets.only(top: 75.h),
                child:
                InkWell(
                  onTap: _tasbeh,
                  child: Stack(
                    alignment: Alignment.center,
                      children: [
                    Transform.rotate(
                        angle: angle,
                        child: Image.asset(AssetsManager.sebhaBody,height: 381.h,)),
                        Column(
                          spacing: 10.h,
                          children: [
                            Text(tasbeh[currentIndex],style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: ColorsManager.white),),
                            Text("$counter",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: ColorsManager.white),),

                          ],
                        )
                      ]),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _tasbeh() {

    setState(() {
      if (counter==33){
        currentIndex = (currentIndex+1)% tasbeh.length;
        counter=0;
      }else{
        counter++;
      }
      angle-=1;
    });
  }
}
