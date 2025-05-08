import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/app/functions.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/domain/usecases/otp_verification_usecase.dart';
import 'package:mynt/domain/usecases/send_otp_usecase.dart';

part 'verification_state.dart';

@injectable
class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit(this._otpVerificationUsecase, this._sendOtpUsecase)
      : super(VerificationInitial());
  final OtpVerificationUsecase _otpVerificationUsecase;
  final SendOtpUsecase _sendOtpUsecase;

  static VerificationCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<bool> verifyOtp(String email, String? enteredOtp) async {
    emit(VerificationLoading());
    if (enteredOtp == null) {
      emit(const VerificationError("OTP not sent or stored."));
      return false;
    }

    final result = await _otpVerificationUsecase(
      OtpVerificationRequest(
        identifier: email,
        token: enteredOtp,
      ),
    );

    return await result.fold(
      (failure) {
        showToast(
            'Verification failed. Please make sure the OTP is correct and try again.',
            ToastType.error);
        emit(VerificationError(failure.message));
        return false;
      },
      (success) {
        showToast("Login successfully!!!", ToastType.success);
        emit(VerificationSuccess());
        return true;
      },
    );
  }

  Future<bool> resendOtp(String email) async {
    final result = await _sendOtpUsecase(
      SendOtpRequest(identifier: email),
    );
    return await result.fold(
      (failure) {
        showToast('Failed to send verification code. Please try again later.',
            ToastType.error);
        emit(SendOtpError(failure.message));
        return true;
      },
      (success) {
        showToast("Verification code has been sent again.", ToastType.success);
        emit(SendOtpSuccess());
        return false;
      },
    );
  }
}
