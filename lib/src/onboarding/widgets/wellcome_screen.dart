import 'package:doula/common/utils/kcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WellcomeScreen extends StatelessWidget {
  const WellcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Kolors.kWhite,
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Image.asset('assets/images/experience.png', fit: BoxFit.cover),
            
            ],
          ),
        ),
      ),
    );
  }
}
