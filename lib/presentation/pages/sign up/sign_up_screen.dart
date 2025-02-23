import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynt/core/constants/app_colors.dart';
import 'package:mynt/core/widgets/app_text_button.dart';
import 'package:mynt/core/widgets/app_text_form_field.dart';
import 'package:mynt/presentation/pages/sign%20in/sign_in_screen.dart';
import 'package:mynt/presentation/pages/sign%20up/email%20verification/email_verfication.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 64.h,
            ),
            Center(
              child: SvgPicture.asset(
                'assets/images/mynt.svg',
                height: 120.h,
                width: 120.w,
              ),
            ),
            Center(
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text1,
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Center(
              child: Text(
                'Welcome to Mynt Hospitality\nChoose your Experience',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.text2),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Email',
              style: TextStyle(fontSize: 14.sp),
            ),
            SizedBox(
              height: 16.h,
            ),
            const AppTextFormField(
              hintText: "Email",
              isBorderEnabled: false,
              prefixIcon: Icon(Icons.email_outlined),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.text2,
                      fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()));
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: const Color(0xFF3F757C),
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 250.h,
            ),
            AppTextButton(
              buttonText: 'Next',
              buttonHeight: 48.h,
              backgroundColor: AppColors.primary,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EmailVerification()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
