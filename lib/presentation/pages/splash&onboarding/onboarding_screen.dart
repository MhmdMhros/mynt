import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/presentation/pages/splash&onboarding/widgets/onboarding1_screen.dart';
import 'package:mynt/presentation/pages/splash&onboarding/widgets/onboarding2_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:mynt/core/constants/app_colors.dart';
import 'package:mynt/core/widgets/app_text_button.dart';
import 'package:mynt/presentation/pages/layout/layout_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _skip() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LayoutScreen()),
    );
  }

  void _next() {
    if (_currentPage == 0) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LayoutScreen()),
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: _skip,
            child: Text(
              'Skip',
              style: TextStyle(
                color: const Color(0xFF545453),
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: const [
                  OnboardingPage1(),
                  OnboardingPage2(),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: 2,
              effect: ScrollingDotsEffect(
                dotHeight: 6.h,
                dotWidth: 6.w,
                activeDotColor: const Color(0xFFB5C9CC),
                dotColor: const Color(0xFFE7EEEF),
              ),
            ),
            SizedBox(height: 50.h),
            AppTextButton(
              buttonText: 'Continue',
              buttonHeight: 48.h,
              backgroundColor: AppColors.primary,
              onPressed: _next,
            ),
            SizedBox(height: 64.h),
          ],
        ),
      ),
    );
  }
}
