import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app_c15_friday/core/resources/assets_manager.dart';
import 'package:islami_app_c15_friday/core/resources/colors_manager.dart';
import 'package:islami_app_c15_friday/core/routes_manager/routes_manager.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});


  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);

    },);


    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 3,
            ),
            SvgPicture.asset("assets/images/splash_logo.svg"),
            Spacer(flex: 2,),
            Image.asset(AssetsManager.brandingImage),
            Spacer(flex: 1,)
          ],
        ),
      ),
    );
  }
}
