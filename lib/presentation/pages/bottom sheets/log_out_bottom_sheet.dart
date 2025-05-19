// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynt/app/functions.dart';
import 'package:mynt/core/app_prefs/app_prefs.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/core/user_secure_storage.dart';
import 'package:mynt/di.dart';
import 'package:mynt/presentation/pages/more/cubit/more_cubit.dart';
import 'package:mynt/presentation/pages/sign%20in/sign_in_screen.dart';

class LogOutBottomSheet extends StatelessWidget {
  const LogOutBottomSheet({super.key});

  Future<void> resetIsInMainLayout() async {
    await getIt<AppPreferences>().resetIsUserLogin();
    await getIt<AppPreferences>().saveIsOnBoardingScreenViewed();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoreCubit, MoreState>(builder: (context, state) {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 1. SVG Image
                  SvgPicture.asset(
                    'assets/images/log_out.svg',
                    height: 100.h,
                  ),
                  SizedBox(height: 16.h),

                  // 2. Centered Text 1
                  Text(
                    'Logout',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: AppColors.text1,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // 3. Centered Text 2
                  Text(
                    'Are you sure that you want to logout',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      color: AppColors.text2,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // 4. Bottom Buttons
                  buildBottomButtons(context),
                ],
              ),
              Positioned(
                right: 0,
                child: Container(
                  width: 30.w, // Adjust width
                  height: 30.h, // Adjust height
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius:
                        BorderRadius.circular(8.r), // Add border radius
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.close,
                        size: 16, color: Color(0xFFA6A6A6)),
                    padding: EdgeInsets.zero, // Remove default padding
                    onPressed: () {
                      Navigator.pop(context); // Dismiss Bottom Sheet
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget buildBottomButtons(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _buildButton(
              "Delete",
              Colors.white,
              const Color(0xFFBF4C43),
              () async {
                final cubit = MoreCubit.get(context);
                final success = await cubit.logout();
                final userName =
                    await getIt<UserSecureStorage>().getUserEmail();
                if (success && context.mounted) {
                  await resetIsInMainLayout();
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          SignInScreen(userName ?? ''),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                } else {
                  showToast('Failed during logout, please try again.',
                      ToastType.error);
                }
              },
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: _buildButton("Decline", AppColors.primary, Colors.white, () {
              Navigator.pop(context);
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
      String text, Color backGColor, Color textColor, VoidCallback onPressed) {
    return SizedBox(
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backGColor,
          padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(
              color: text == "Delete"
                  ? const Color(0xFFBF4C43)
                  : AppColors.primary,
              width: 1.w,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            color: textColor,
            fontWeight: FontWeight.w600,
            fontFamily: "Montserrat",
          ),
        ),
      ),
    );
  }
}
