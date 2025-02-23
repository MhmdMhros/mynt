import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynt/core/constants/app_colors.dart';
import 'package:mynt/core/widgets/app_text_button.dart';
import 'package:mynt/core/widgets/app_text_form_field.dart';
import 'package:mynt/presentation/pages/layout/layout_screen.dart';
import 'package:mynt/presentation/pages/sign%20up/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Sign In',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Center(
                child: SvgPicture.asset(
                  'assets/images/mynt.svg',
                  height: 120.h,
                  width: 120.w,
                ),
              ),
              SizedBox(height: 8.h),
              Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.text1,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Center(
                child: Text(
                  'Welcome to Mynt Hospitality Choose your Experience',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.text2,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.text1,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const AppTextFormField(
                hintText: "Email",
                isBorderEnabled: false,
                prefixIcon: Icon(Icons.person_2_outlined),
              ),
              SizedBox(height: 16.h),
              Text(
                'Create Password',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text1,
                ),
              ),
              SizedBox(height: 16.h),
              const AppTextFormField(
                hintText: "Password",
                isBorderEnabled: false,
                isObscureText: true,
                prefixIcon: Icon(Icons.lock_clock_outlined),
                suffixIcon: Icon(Icons.visibility_off_outlined),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forget My Password?',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.text1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'I don\'t have account',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.text1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: const Color(0xFF3F757C),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              AppTextButton(
                buttonText: 'Create Account',
                buttonHeight: 48.h,
                backgroundColor: AppColors.primary,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LayoutScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
