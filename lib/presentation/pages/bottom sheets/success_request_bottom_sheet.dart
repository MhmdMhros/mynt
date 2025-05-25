import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynt/core/resources/colors_manager.dart';

class SuccessRequestBottomSheet extends StatelessWidget {
  final String message;
  const SuccessRequestBottomSheet(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      child: FractionallySizedBox(
        heightFactor: 0.55,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 12.h),

                  Center(
                    child: SvgPicture.asset(
                      'assets/images/success_request.svg',
                      height: 100.h, // Increased height
                      width: 100.w, // Added width
                      fit: BoxFit.contain, // Ensures it scales properly
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // 3. Centered Text 2
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
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
