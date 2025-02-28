import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/constants/app_colors.dart';

class SuccessPassBottomSheet extends StatelessWidget {
  const SuccessPassBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      child: FractionallySizedBox(
        heightFactor: 0.65, // 50% of screen height

        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/gifs/pass_success.gif',
                    height: 200.h, // Increased height
                    width: 200.w, // Added width
                    fit: BoxFit.contain, // Ensures it scales properly
                  ),
                  SizedBox(height: 8.h),

                  // 3. Centered Text 2
                  Text(
                    'password has been reset successfully!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'Montserrat',
                      color: AppColors.text1,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
