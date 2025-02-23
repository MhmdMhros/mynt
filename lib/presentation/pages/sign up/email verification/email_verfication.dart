import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynt/core/constants/app_colors.dart';
import 'package:mynt/core/widgets/app_text_button.dart';
import 'package:mynt/presentation/pages/sign%20up/create%20password/create_password.dart';

class EmailVerification extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();

  EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultBorderColor = Colors.grey.shade300;
    final focusedBorderColor = AppColors.primary;

    final pinWidth = 56.w;
    final pinHeight = 56.h;

    final defaultPinDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: defaultBorderColor),
    );

    final focusedPinDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: focusedBorderColor, width: 2),
    );

    final submittedPinDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: focusedBorderColor),
    );

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Verification Code',
            style: TextStyle(
              fontSize: 18.sp,
              color: AppColors.text1,
            ),
          ),
        ),
        backgroundColor: AppColors.background,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.keyboard_arrow_left,
            color: AppColors.primary,
            size: 32.h,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            SvgPicture.asset(
              'assets/images/ver.svg',
              height: 100.h,
              width: 100.w,
            ),
            SizedBox(height: 24.h),
            Text(
              'Verification Code',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.text1,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Please enter the verification code sent to\nemail ali@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.text2,
              ),
            ),
            SizedBox(height: 50.h),
            Pinput(
              controller: otpController,
              length: 4,
              showCursor: true,
              pinContentAlignment: Alignment.center,
              preFilledWidget: Center(
                child: Text(
                  '--',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
              defaultPinTheme: PinTheme(
                width: pinWidth,
                height: pinHeight,
                textStyle: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
                decoration: defaultPinDecoration,
              ),
              focusedPinTheme: PinTheme(
                width: pinWidth,
                height: pinHeight,
                textStyle: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
                decoration: focusedPinDecoration,
              ),
              submittedPinTheme: PinTheme(
                width: pinWidth,
                height: pinHeight,
                textStyle: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
                decoration: submittedPinDecoration,
              ),
              onCompleted: (otp) {
                if (otp == '1234') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreatePassword()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Invalid OTP',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.offWhite,
                          fontSize: 16.0,
                        ),
                      ),
                      backgroundColor: AppColors.primary,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 100.h),
            Row(
              children: [
                Text(
                  'Resend Code',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
                const Spacer(),
                Text(
                  '00:59',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.text1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 150.h),
            AppTextButton(
              buttonText: 'Confirm',
              buttonHeight: 48.h,
              backgroundColor: AppColors.primary,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreatePassword(),
                  ),
                );
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
