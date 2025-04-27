import 'package:doula/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight-50.h,
            child: Image.asset(R.ASSETS_IMAGES_WISHLIST_PNG, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
