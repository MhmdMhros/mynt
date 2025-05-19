// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/core/widgets/app_text_button.dart';
import 'package:mynt/core/widgets/app_text_form_field.dart';
import 'package:mynt/presentation/pages/bottom%20sheets/success_pass_bottom_sheet.dart';
import 'package:mynt/presentation/pages/email%20verification/email_verfication.dart';
import 'package:mynt/presentation/pages/layout/layout_screen.dart';
import 'package:mynt/presentation/pages/sign%20in/cubit/login_cubit.dart';

class CreatePasswordScreen extends StatefulWidget {
  final String userName;
  const CreatePasswordScreen(this.userName, {super.key});

  @override
  _CreatePasswordScreenState createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void showSuccessPassBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) => const SuccessPassBottomSheet(),
    );

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LayoutScreen()),
      );
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
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
              child: Form(
                key: _formKey,
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
                    SizedBox(height: 8.h),
                    AppTextFormField(
                      controller: _passwordController,
                      hintText: "Password",
                      isBorderEnabled: false,
                      isObscureText: !_isPasswordVisible,
                      prefixIcon: Icon(
                        Icons.lock_clock_outlined,
                        size: 22.sp,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        } else if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
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
                    SizedBox(height: 8.h),
                    AppTextFormField(
                      controller: _confirmPasswordController,
                      hintText: "Confirm Password",
                      isBorderEnabled: false,
                      isObscureText: !_isConfirmPasswordVisible,
                      prefixIcon: Icon(
                        Icons.lock_clock_outlined,
                        size: 22.sp,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 20.sp,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        } else if (value != _passwordController.text) {
                          return 'Password does not match';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: AppTextButton(
                        buttonText: 'Continue',
                        buttonHeight: 48.h,
                        backgroundColor: AppColors.primary,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final success = await LoginCubit.get(context)
                                .sendOtpRequest(widget.userName);
                            if (success) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EmailVerification(
                                      widget.userName,
                                      '',
                                      '',
                                      '',
                                      _passwordController.text,
                                      'auth_reset'),
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
