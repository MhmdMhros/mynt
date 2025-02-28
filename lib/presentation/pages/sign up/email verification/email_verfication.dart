import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynt/core/constants/app_colors.dart';
import 'package:mynt/core/widgets/app_text_button.dart';
import 'package:mynt/presentation/pages/sign%20up/create%20password/create_password.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final TextEditingController otpController = TextEditingController();
  late Timer _timer;
  int _seconds = 59;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    otpController.dispose();
    super.dispose();
  }

  String _formatTime() {
    int minutes = _seconds ~/ 60;
    int seconds = _seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _resendCode() {
    setState(() {
      _seconds = 59;
    });
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final defaultBorderColor = Colors.grey.shade300;
    const focusedBorderColor = AppColors.primary;

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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.text1),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text(
          "Verification",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: AppColors.text1,
          ),
        ),
        centerTitle: true,
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
                fontFamily: 'Montserrat',
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
                fontFamily: 'Montserrat',
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
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              defaultPinTheme: PinTheme(
                width: pinWidth,
                height: pinHeight,
                textStyle: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                ),
                decoration: defaultPinDecoration,
              ),
              focusedPinTheme: PinTheme(
                width: pinWidth,
                height: pinHeight,
                textStyle: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                ),
                decoration: focusedPinDecoration,
              ),
              submittedPinTheme: PinTheme(
                width: pinWidth,
                height: pinHeight,
                textStyle: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
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
                          fontFamily: 'Montserrat',
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
                GestureDetector(
                  onTap: _seconds == 0 ? _resendCode : null,
                  child: Text(
                    'Resend Code',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: _seconds == 0 ? AppColors.primary : Colors.grey,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  _formatTime(),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    color: AppColors.text1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppTextButton(
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
      ),
    );
  }
}
