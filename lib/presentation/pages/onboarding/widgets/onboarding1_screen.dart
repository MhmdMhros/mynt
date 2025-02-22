import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100.h),
        Center(
          child: SvgPicture.asset(
            'assets/images/onboarding1.svg',
            height: 200.h,
            width: 200.w,
          ),
        ),
      ],
    );
  }
}