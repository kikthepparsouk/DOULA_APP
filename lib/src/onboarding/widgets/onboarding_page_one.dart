import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';





class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/wishlist.png',
              fit: BoxFit.cover,
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
            ),
           
           
          ],
        ),
      ),
    );
  }
}