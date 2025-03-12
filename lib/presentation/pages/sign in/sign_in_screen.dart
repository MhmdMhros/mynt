import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynt/core/constants/app_colors.dart';
import 'package:mynt/core/widgets/app_text_button.dart';
import 'package:mynt/core/widgets/app_text_form_field.dart';
import 'package:mynt/presentation/pages/email%20verification/email_verfication.dart';
import 'package:mynt/presentation/pages/layout/layout_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isPasswordVisible = false; // Toggle password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Sign In",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: AppColors.text1,
          ),
        ),
        centerTitle: true,
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
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    color: AppColors.text1,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Center(
                child: Text(
                  'Welcome to Mynt Hospitality\nChoose your Experience',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'Montserrat',
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
                  fontFamily: 'Montserrat',
                  color: AppColors.text1,
                  fontWeight: FontWeight.w600,
                ),
              ),
              AppTextFormField(
                hintText: "Email",
                isBorderEnabled: false,
                prefixIcon: Icon(
                  Icons.person_2_outlined,
                  size: 24.sp,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Password',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  color: AppColors.text1,
                ),
              ),
              SizedBox(height: 16.h),
              AppTextFormField(
                hintText: "Password",
                isBorderEnabled: false,
                isObscureText: !_isPasswordVisible, // Toggle visibility
                prefixIcon: Icon(
                  Icons.lock_clock_outlined,
                  size: 24.sp,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    size: 20.sp, // Eye icon toggle
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EmailVerification(),
                        ),
                      );
                    },
                    child: Text(
                      'Forget My Password?',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Montserrat',
                        color: AppColors.text1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppTextButton(
          buttonText: 'Sign In',
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
      ),
    );
  }
}
