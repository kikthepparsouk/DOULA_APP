import 'package:doula/common/utils/kcolors.dart';
import 'package:doula/common/utils/kstrings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OnboardingPageTwo extends StatelessWidget {
  const OnboardingPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/getstarted.png',
              fit: BoxFit.cover,
             
            ),
            
          ],
        ),
      ),
    );
  }
}