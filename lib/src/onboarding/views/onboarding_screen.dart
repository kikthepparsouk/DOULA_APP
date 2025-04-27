import 'package:doula/common/utils/kcolors.dart';
import 'package:doula/src/onboarding/controllers/onboarding_notifier.dart';
import 'package:doula/src/onboarding/widgets/onboarding_page_one.dart';
import 'package:doula/src/onboarding/widgets/onboarding_page_two.dart';
import 'package:doula/src/onboarding/widgets/wellcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: context.read<OnboardingNotifier>().selectedIndex,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Kolors.kRed,
        foregroundColor: Kolors.kWhite,
        title: const Text('Onboarding Screen'),
      ),
      body: Consumer<OnboardingNotifier>(
        builder: (context, onboardingNotifier, _) {
          return Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: 3,
                onPageChanged: (index) {
                  onboardingNotifier.setSelectedIndex(index);
                },
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return const WelcomeScreen();
                    case 1:
                      return const OnboardingPageOne();
                    case 2:
                      return const OnboardingPageTwo();
                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
              
              // Page indicator dots
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (dotIndex) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: onboardingNotifier.selectedIndex == dotIndex ? 12 : 10,
                      height: onboardingNotifier.selectedIndex == dotIndex ? 12 : 10,
                      decoration: BoxDecoration(
                        color: onboardingNotifier.selectedIndex == dotIndex
                            ? Kolors.kRed
                            : Kolors.kGray,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}