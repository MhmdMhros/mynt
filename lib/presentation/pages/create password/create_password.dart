import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/core/widgets/app_text_button.dart';
import 'package:mynt/core/widgets/app_text_form_field.dart';
import 'package:mynt/presentation/pages/bottom%20sheets/success_pass_bottom_sheet.dart';
import 'package:mynt/presentation/pages/layout/layout_screen.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreatePasswordState createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void showSuccessPassBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return const SuccessPassBottomSheet();
      },
    );

    // Delay navigation by 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LayoutScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
          "Set new password",
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
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                  color: AppColors.text1,
                ),
              ),
              SizedBox(height: 16.h),
              AppTextFormField(
                hintText: "Password",
                isBorderEnabled: false,
                isObscureText: !_isPasswordVisible,
                prefixIcon: Icon(
                  Icons.lock_clock_outlined,
                  size: 24.sp,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    size: 20.sp,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Retype Password',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                  color: AppColors.text1,
                ),
              ),
              SizedBox(height: 16.h),
              AppTextFormField(
                hintText: "Confirm Password",
                isBorderEnabled: false,
                isObscureText: !_isConfirmPasswordVisible,
                prefixIcon: Icon(
                  Icons.lock_clock_outlined,
                  size: 20.sp,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    size: 24.sp,
                  ),
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppTextButton(
          buttonText: 'Continue',
          buttonHeight: 48.h,
          backgroundColor: AppColors.primary,
          onPressed: () {
            showSuccessPassBottomSheet(context);
          },
        ),
      ),
    );
  }
}
