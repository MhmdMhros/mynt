import 'dart:io';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mynt/app/functions.dart';
import 'package:mynt/core/firebase_api.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/domain/usecases/check_account_usecase.dart';
import 'package:mynt/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/domain/usecases/send_otp_usecase.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
      this._loginUseCase, this._checkAccountUsecase, this._sendOtpUsecase)
      : super(LoginInitial());
  final LoginUseCase _loginUseCase;
  final CheckAccountUsecase _checkAccountUsecase;
  final SendOtpUsecase _sendOtpUsecase;

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  int? otp;
  String? glopalUserName;
  String? glopalPassword;
  String? glopalDeviceToken;
  String? glopalDeviceType;

  bool staySignIn = false;

  bool isConnected = true;

  void onStaySignInChange(bool staySignIn) => this.staySignIn = staySignIn;

  void initializeLoginData(String? email, String? password) {
    if (email != null && password != null) {
      glopalUserName = email;
      glopalPassword = password;
      glopalDeviceToken = FirebaseApi().fCMToken;
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

  Future<bool> checkUserIsExist(String userName) async {
    emit(LoginLoading(userName));
    final checkResult = await _checkAccountUsecase(
      CheckAccountRequest(login: userName),
    );
    return await checkResult.fold((failure) {
      // showToast('No account found with this email. Please check and try again.',
      //     ToastType.error);
      emit(LoginError(failure.message));
      return false;
    }, (success) {
      return true;
    });
  }

  Future<bool> sendOtpRequest(String userName) async {
    emit(LoginLoading(userName));
    final sendSuccess = await _sendOtpUsecase(
      SendOtpRequest(identifier: userName),
    );
    return await sendSuccess.fold((failure) {
      // showToast('Failed to send verification code. Please try again later.',
      //     ToastType.error);
      emit(LoginError(failure.message));
      return false;
    }, (success) {
      showToast('Verify your account to complete the login process.',
          ToastType.warning);
      return true;
    });
  }

  Future<bool> checkAndLogin() async {
    emit(LoginLoading(glopalUserName!));
    // checkLoginConnectivity();
    final checkResult = await _checkAccountUsecase(
      CheckAccountRequest(login: glopalUserName!),
    );
    showToast(glopalDeviceToken!, ToastType.warning);
    return await checkResult.fold(
      (failure) {
        // showToast(
        //     'No account found with this email. Please check and try again.',
        //     ToastType.error);
        emit(LoginError(failure.message));
        return false;
      },
      (checkSuccess) async {
        final loginResult = await _loginUseCase(
          LoginRequest(
            userName: glopalUserName ?? '',
            password: glopalPassword ?? '',
            deviceToken: glopalDeviceToken ?? '',
            deviceType: glopalDeviceType ?? '',
          ),
        );

        return await loginResult.fold(
          (failure) {
            emit(LoginError(failure.message));
            return false;
          },
          (loginSuccess) async {
            emit(LoginSuccess());
            final sendOtpResult = await _sendOtpUsecase(
              SendOtpRequest(identifier: glopalUserName!),
            );

            return await sendOtpResult.fold(
              (failure) {
                emit(LoginError(failure.message));
                return false;
              },
              (sendOtpSuccess) async {
                otp = sendOtpSuccess.token;
                return true;
              },
            );
          },
        );
      },
    );
  }

  // void checkLoginConnectivity() async {
  //   final List<ConnectivityResult> connectivityResult =
  //       await (Connectivity().checkConnectivity());

  //   if (connectivityResult.contains(ConnectivityResult.mobile)) {
  //     isConnected = true;
  //     emit(LoginConnectivityChanged(isConnected));
  //   } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
  //     isConnected = true;
  //     emit(LoginConnectivityChanged(isConnected));
  //   } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
  //     isConnected = true;
  //     emit(LoginConnectivityChanged(isConnected));
  //   } else {
  //     isConnected = false;
  //     emit(LoginConnectivityChanged(isConnected));
  //   }
  // }
}
