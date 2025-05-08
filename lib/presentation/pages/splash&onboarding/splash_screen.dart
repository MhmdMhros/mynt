import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynt/core/app_prefs/app_prefs.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/di.dart';
import 'package:mynt/presentation/pages/layout/layout_screen.dart';
import 'package:mynt/presentation/pages/sign%20in/sign_in_screen.dart';
import 'package:mynt/presentation/pages/splash&onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 2 seconds before navigating to the OnboardingScreen.
    _navigateAfterDelay();
  }

  Future<void> _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 3));

    final bool isLoggedIn = getIt<AppPreferences>().getIsUserLogin();
    final bool isOnBoardingViewed =
        getIt<AppPreferences>().getIsOnBoardingScreenViewed();

    Widget nextScreen;

    if (isLoggedIn) {
      nextScreen = const LayoutScreen(); // Main layout/home screen
    } else if (isOnBoardingViewed) {
      nextScreen = const SignInScreen();
    } else {
      nextScreen = const OnboardingScreen();
    }

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => nextScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SvgPicture.asset(
          'assets/images/logo.svg',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
