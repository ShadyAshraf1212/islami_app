import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/colors_manager.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({super.key, required this.active});
  final active;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration:Duration(milliseconds: 300),
      height: 10,
      width: active ? 20:10,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
          color: active ? ColorsManager.gold : Colors.grey,
          borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}
