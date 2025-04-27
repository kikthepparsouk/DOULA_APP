import 'package:doula/common/utils/kcolors.dart';
import 'package:doula/common/utils/kstrings.dart';
import 'package:doula/common/widgets/custom_button.dart';
import 'package:doula/common/widgets/reusable_text.dart';
import 'package:doula/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingPageTwo extends StatelessWidget {
  const OnboardingPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Added SafeArea for better device compatibility
        child: LayoutBuilder(
          // Use LayoutBuilder for responsive constraints
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight, // Changed to minHeight
                ),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center content vertically
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20.h), // Reasonable top spacing
                    Image.asset(
                      R.ASSETS_IMAGES_GETSTARTED_PNG,
                      width:
                          constraints.maxWidth * 0.8, // Constrained image width
                      fit: BoxFit.contain, // Ensure proper image scaling
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        AppText.kWelcomeHeader,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Kolors.kGray,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        AppText.kWelcomeMessage,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Kolors.kGray,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 30.h), // Increased spacing before button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: CustomButton(
                        text: AppText.kGetStart,
                        onTap: () {
                          // Storage().setBool("isLoggedIn", true);
                          GoRouter.of(context).go('/home');
                        },
                        btnHieght: 50.h, // Use responsive height
                        btnWidth: double.infinity, // Take full available width
                        radius: 20.r, // Use responsive radius
                      ),
                    ),
                    SizedBox(height: 20.h), // Bottom spacing

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReusableText(
                          text: "Already have an Account ?",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Kolors.kGray,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.go('/login');
                            // GoRouter.of(context).go('/login');
                          },
                          child: ReusableText(
                            text: AppText.klogin,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Kolors.kRed,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h), // Bottom spacing
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
