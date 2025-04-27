import 'package:doula/common/utils/kcolors.dart';
import 'package:doula/const/resource.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Container(
                  color: Kolors.kWhite,
                  width: constraints.maxWidth,  // Use constraints instead of ScreenUtil
                  height: constraints.maxHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: constraints.maxWidth,
                          maxHeight: constraints.maxHeight * 1,  // Limit image height
                        ),
                        child: Image.asset(
                          R.ASSETS_IMAGES_EXPERIENCE_PNG,
                          fit: BoxFit.contain,  // Changed from cover to contain
                        ),
                      ),
                      // Add other content here as needed
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}