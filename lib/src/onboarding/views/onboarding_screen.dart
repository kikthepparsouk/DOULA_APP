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
    // TODO: implement initState
    _pageController = PageController(initialPage: context.read<OnboardingNotifier>().selectedIndex);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Kolors.kRed,
        foregroundColor: Kolors.kWhite,
        title: const Text('Onboarding Screen'),
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            itemCount: 3,
            onPageChanged: (index) {
              Provider.of<OnboardingNotifier>(context, listen: false)
                  .setSelectedIndex(index);
            },
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return const WellcomeScreen();
                case 1:
                  return const OnboardingPageOne();
                case 2:
                  return const OnboardingPageTwo();
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
          
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color:
                        Provider.of<OnboardingNotifier>(context).selectedIndex ==
                                index
                            ? Kolors.kRed
                            : Kolors.kGray,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
        ],
      )
    );
    
  }
}
