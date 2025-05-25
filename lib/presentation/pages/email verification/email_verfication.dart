// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/app/functions.dart';
import 'package:mynt/core/app_prefs/app_prefs.dart';
import 'package:mynt/di.dart';
import 'package:mynt/presentation/pages/email%20verification/cubit/verification_cubit.dart';
import 'package:mynt/presentation/pages/layout/layout_screen.dart';
import 'package:mynt/presentation/pages/sign%20in/sign_in_screen.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/core/widgets/app_text_button.dart';

class EmailVerification extends StatefulWidget {
  final String email;
  final String phoneNumber;
  final String name;
  final String gender;
  final String newPassword;
  final String
      type; //  type = 'edit_email', 'edit_phone', 'edit_data' or 'auth'
  const EmailVerification(this.email, this.phoneNumber, this.name, this.gender,
      this.newPassword, this.type,
      {super.key});

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

  Future<void> isUserLogged() async =>
      await getIt<AppPreferences>().saveIsUserLogin();

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

    return BlocProvider(
      create: (_) => getIt<VerificationCubit>(),
      child: BlocConsumer<VerificationCubit, VerificationState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = VerificationCubit.get(context);
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: Padding(
                padding: EdgeInsets.only(left: 30.w),
                child: IconButton(
                  icon:
                      const Icon(Icons.arrow_back_ios, color: AppColors.text1),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              title: Text(
                "Verification",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
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
                    'Please enter the verification code sent to\n ${widget.email}',
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
                    length: 6,
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
                    onCompleted: (otp) async {
                      final success = await cubit.verifyOtp(widget.email, otp);
                      if (success) {
                        if (widget.type == 'auth_login') {
                          showToast(
                              "You’ve just joined Mynt! 🎉", ToastType.success);
                          await isUserLogged();
                          // await CubitManager.disposeAllCubits(context);
                          // context.read<LayoutCubit>().close();
                          // context.read<NotificationsCubit>().close();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LayoutScreen(),
                            ),
                            (route) => false,
                          );
                        } else if (widget.type == 'auth_reset') {
                          final resetSuccess = await cubit.resetPassword(
                              email: widget.email,
                              newPassword: widget.newPassword,
                              confirmPassword: widget.newPassword);
                          if (resetSuccess) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SignInScreen(widget.email)),
                              (route) => false,
                            );
                          } else {
                            Navigator.pop(context);
                          }
                        } else if (widget.type == 'edit_data') {
                          final editSuccess = await cubit.editAccountData(
                              widget.name, widget.gender);
                          if (editSuccess) {
                            Navigator.pop(context, {
                              'name': widget.name,
                              'gender': widget.gender,
                            });
                          } else {
                            Navigator.pop(context);
                          }
                        } else if (widget.type == 'edit_email') {
                          final editSuccess =
                              await cubit.editEmail(widget.email);
                          if (editSuccess) {
                            Navigator.pop(context, {
                              'email': widget.email,
                            });
                          } else {
                            Navigator.pop(context);
                          }
                        } else if (widget.type == 'edit_phone') {
                          final editSuccess =
                              await cubit.editPhone(widget.phoneNumber);
                          if (editSuccess) {
                            Navigator.pop(context, {
                              'name': widget.phoneNumber,
                            });
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      }
                    },
                  ),
                  SizedBox(height: 100.h),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          if (_seconds == 0) {
                            final success = await cubit.resendOtp(
                                widget.phoneNumber == ''
                                    ? widget.email
                                    : widget.phoneNumber);
                            if (success) {
                              _resendCode();
                            }
                          }
                        },
                        child: Text(
                          'Resend Code',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            color:
                                _seconds == 0 ? AppColors.primary : Colors.grey,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: AppTextButton(
                      buttonText: 'Confirm',
                      buttonHeight: 48.h,
                      backgroundColor: AppColors.primary,
                      onPressed: () async {
                        final success = await cubit.verifyOtp(
                            widget.phoneNumber == ''
                                ? widget.email
                                : widget.phoneNumber,
                            otpController.text);
                        if (success) {
                          if (widget.type == 'auth') {
                            await isUserLogged();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LayoutScreen()),
                              (route) => false,
                            );
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
