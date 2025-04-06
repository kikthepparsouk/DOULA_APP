import 'package:doula/common/services/storage.dart';
import 'package:doula/common/utils/kcolors.dart';
import 'package:doula/const/resource.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  // Future<void> _navigateToHome() async {
  //   // Wait for 3 seconds (3000 milliseconds)
  //   await Future.delayed(const Duration(seconds: 3));
    
  //   // Navigate to home screen and remove splash from stack
  //   if (Storage.getBool('isLoggedIn') == null) {
  //     GoRouter.of(context).go('/onboarding');
  //   } else {
  //     // Check if the user is logged in 
  //     GoRouter.of(context).go('/login');
      
    
  //   }
  // }

  Future<void> _navigateToHome() async {
  await Future.delayed(const Duration(seconds: 3));
  
  if (!mounted) return;

  try {
    // final prefs = await SharedPreferences.getInstance();
    // final isLoggedIn = prefs.getBool('firstopen');

    if (Storage().getBool('isLoggedIn') == null) {
      GoRouter.of(context).go('/onboarding');
    } else {
      GoRouter.of(context).go('/home');
    }
  } catch (e) {
    debugPrint('Storage error: $e');
    if (mounted) context.go('/error');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kOffWhite,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.ASSETS_IMAGES_SPLASHSCREEN_PNG),

            fit: BoxFit.cover,
          ),
        ),
        child: Text(
          'Splash Screen',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  
   
  }
}
