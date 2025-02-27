import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynt/core/constants/app_colors.dart';
import 'package:mynt/core/widgets/app_text_button.dart';
import 'package:mynt/core/widgets/app_text_form_field.dart';
import 'package:mynt/presentation/pages/layout/layout_screen.dart';

class CreatePassword extends StatelessWidget {
  const CreatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Create Password',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat", // Applied font family
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
              SizedBox(height: 16.h),
              Center(
                child: SvgPicture.asset(
                  'assets/images/password.svg',
                  height: 120.h,
                  width: 120.w,
                ),
              ),
              SizedBox(height: 64.h),
              Text(
                'Create Password',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat", // Applied font family
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
              Text(
                'Retype Password',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat", // Applied font family
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppTextButton(
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
      ),
    );
  }
}
