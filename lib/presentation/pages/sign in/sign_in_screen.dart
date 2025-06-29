// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynt/app/functions.dart';
import 'package:mynt/core/app_prefs/app_prefs.dart';
import 'package:mynt/core/firebase_api.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/core/widgets/app_text_button.dart';
import 'package:mynt/core/widgets/app_text_form_field.dart';
import 'package:mynt/di.dart';
import 'package:mynt/presentation/pages/create%20password/create_password_screen.dart';
import 'package:mynt/presentation/pages/layout/layout_screen.dart';
import 'package:mynt/presentation/pages/more/cubit/more_cubit.dart';
import 'package:mynt/presentation/pages/sign%20in/cubit/login_cubit.dart';
import 'package:mynt/presentation/pages/email%20verification/email_verfication.dart';

class SignInScreen extends StatefulWidget {
  final String email;
  const SignInScreen(this.email, {super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.email != '') {
      emailController.text = widget.email;
    }
    // LoginCubit.get(context).checkLoginConnectivity();
    MoreCubit.get(context);
  }

  Future<void> isUserLogged() async =>
      await getIt<AppPreferences>().saveIsUserLogin();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        if (cubit.isConnected) {
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
                child: Form(
                  key: _formKey,
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
                      SizedBox(height: 14.h),
                      Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.text1,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Center(
                        child: Text(
                          'Welcome to Mynt Hospitality\n Choose your Experience',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.text2,
                            fontFamily: 'Montserrat',
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
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(height: 6.h),
                      AppTextFormField(
                        controller: emailController,
                        hintText: "Email",
                        isBorderEnabled: false,
                        prefixIcon: Icon(Icons.person_2_outlined, size: 24.sp),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.text1,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(height: 6.h),
                      AppTextFormField(
                        controller: passwordController,
                        hintText: "Password",
                        isObscureText: !_isPasswordVisible,
                        isBorderEnabled: false,
                        prefixIcon:
                            Icon(Icons.lock_clock_outlined, size: 24.sp),
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
                          if (value == null || value.trim().isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () async {
                            if (emailController.text.trim().isNotEmpty) {
                              final success = await cubit
                                  .checkUserIsExist(emailController.text);
                              if (success) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => CreatePasswordScreen(
                                        emailController.text),
                                  ),
                                );
                              }
                            } else {
                              showToast(
                                  "Email is required.", ToastType.warning);
                            }
                          },
                          child: Text(
                            'Forget My Password?',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              color: AppColors.text1,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: AppTextButton(
                          buttonHeight: 48.h,
                          backgroundColor: AppColors.primary,
                          onPressed: state is LoginLoading
                              ? () {}
                              : () async {
                                  if (_formKey.currentState!.validate()) {
                                    cubit.initializeLoginData(
                                      emailController.text,
                                      passwordController.text,
                                    );
                                    final success = await cubit.checkAndLogin();
                                    if (success &&
                                        MoreCubit.get(context)
                                                .settingsDataWithoutSlug
                                                ?.owners
                                                ?.enablePhoneOtp ==
                                            '0') {
                                      showToast(
                                          "Verify your account to complete the login process.",
                                          ToastType.warning);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EmailVerification(
                                                  emailController.text,
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  'auth_login'),
                                        ),
                                      );
                                    } else if (success) {
                                      await FirebaseApi().subscribeToTopic();
                                      showToast("You’ve just joined Mynt! 🎉",
                                          ToastType.success);
                                      await isUserLogged();
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LayoutScreen(),
                                        ),
                                        (route) => false,
                                      );
                                    }
                                  }
                                },
                          child: state is LoginLoading
                              ? const SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wifi_off,
                      size: 80.sp,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'No Internet Connection',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                        color: AppColors.text1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Please check your connection and try again.',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24.h),
                    AppTextButton(
                      buttonHeight: 48.h,
                      backgroundColor: AppColors.primary,
                      onPressed: () {
                        // LoginCubit.get(context).checkLoginConnectivity();
                      },
                      child: Text(
                        'Retry',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
