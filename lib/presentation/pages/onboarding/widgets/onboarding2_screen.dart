import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/constants/app_colors.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h),
        Center(
          child: Image.asset(
            'assets/images/onboarding2.gif',
            width: 300.w,
            height: 300.h,
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          'Luxury Living with\nUltimate Flexibility',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.text1,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          'Experience high-quality furnished units that combine comfort and elegance, with the freedom to rent starting from just one month.',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.text2,
          ),
        ),
      ],
    );
  }
}
