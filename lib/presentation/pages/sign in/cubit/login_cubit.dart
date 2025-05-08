import 'dart:io';

import 'package:mynt/app/functions.dart';
import 'package:mynt/core/user_secure_storage.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/di.dart';
import 'package:mynt/domain/usecases/check_account_usecase.dart';
import 'package:mynt/domain/usecases/login_usecase.dart';
import 'package:mynt/domain/usecases/otp_verification_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/domain/usecases/send_otp_usecase.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase, this._checkAccountUsecase,
      this._sendOtpUsecase, this._otpVerificationUsecase)
      : super(LoginInitial());
  final LoginUseCase _loginUseCase;
  final CheckAccountUsecase _checkAccountUsecase;
  final SendOtpUsecase _sendOtpUsecase;
  final OtpVerificationUsecase _otpVerificationUsecase;

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  int? otp;
  String? glopalUserName;
  String? glopalPassword;
  String? glopalDeviceToken;
  String? glopalDeviceType;

  bool staySignIn = false;

  void onStaySignInChange(bool staySignIn) => this.staySignIn = staySignIn;

  void initializeLoginData(String? email, String? password) {
    if (email != null && password != null) {
      glopalUserName = email;
      glopalPassword = password;
      glopalDeviceToken = generateRandomToken(9);
      glopalDeviceType = Platform.isAndroid
          ? 'android'
          : Platform.isIOS
              ? 'ios'
              : null;
      emit(InitialEmailAndPasswordSuccess());
    } else {
      emit(InitialEmailAndPasswordError());
    }
  }

  // Send OTP
  Future<bool> resendOtp() async {
    final result = await _sendOtpUsecase(
      SendOtpRequest(identifier: glopalUserName!),
    );
    return await result.fold(
      (failure) {
        showToast(failure.message, ToastType.error);
        emit(LoginError(failure.message));
        return true;
      },
      (success) {
        otp = success.token;
        showToast("Verification code has been sent again.", ToastType.success);
        emit(SendOtpSuccess());
        return false;
      },
    );
  }

  Future<bool> verifyOtp(String? enteredOtp) async {
    emit(VerifyOtpLoading());
    if (enteredOtp == null) {
      emit(const LoginError("OTP not sent or stored."));
      return false;
    }

    final result = await _otpVerificationUsecase(
      OtpVerificationRequest(
        identifier: glopalUserName!,
        token: enteredOtp,
      ),
    );

    return await result.fold(
      (failure) {
        showToast(failure.message, ToastType.error);
        emit(VerifyOtpError(failure.message));
        return false;
      },
      (success) {
        showToast("Login successfully!!!", ToastType.success);
        emit(VerifyOtpSuccess(success.message));
        return true;
      },
    );
  }

  Future<bool> checkAndLogin() async {
    emit(LoginLoading());

    final checkResult = await _checkAccountUsecase(
      CheckAccountRequest(login: glopalUserName!),
    );

    return await checkResult.fold(
      (failure) {
        showToast(failure.message, ToastType.error);
        emit(LoginError(failure.message));
        return false;
      },
      (checkSuccess) async {
        print("Check Account Successssssssssssssssssssssssssssss");
        final loginResult = await _loginUseCase(
          LoginRequest(
            userName: glopalUserName!,
            password: glopalPassword!,
            deviceToken: glopalDeviceToken!,
            deviceType: glopalDeviceType!,
          ),
        );

        return await loginResult.fold(
          (failure) {
            showToast(failure.message, ToastType.error);
            print("send otp successsssssssssssssssssssssssssssssss");

            emit(LoginError(failure.message));
            return false;
          },
          (loginSuccess) async {
            print("login successssssssssssssssssssss");
            emit(LoginSuccess());

            final sendOtpResult = await _sendOtpUsecase(
              SendOtpRequest(identifier: glopalUserName!),
            );

            return await sendOtpResult.fold(
              (failure) {
                showToast(failure.message, ToastType.error);

                emit(LoginError(failure.message));
                return false;
              },
              (sendOtpSuccess) async {
                print("send otp successsssssssssssssssssssssssssssssss");

                await getIt<UserSecureStorage>().upsertUserInfo(
                  userId: loginSuccess.userId,
                  email: glopalUserName,
                  password: glopalPassword,
                  accessToken: loginSuccess.accessToken,
                  refreshToken: loginSuccess.refreshToken,
                  expiresIn: loginSuccess.expiresIn,
                );
                otp = sendOtpSuccess.token;
                showToast("Verify your account to complete the login process.",
                    ToastType.warning);
                return true;
              },
            );
          },
        );
      },
    );
  }
}
