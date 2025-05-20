import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/app/functions.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/domain/usecases/edit_account_data_usecase.dart';
import 'package:mynt/domain/usecases/edit_email_usecase.dart';
import 'package:mynt/domain/usecases/edit_phone_usecase.dart';
import 'package:mynt/domain/usecases/otp_verification_usecase.dart';
import 'package:mynt/domain/usecases/reset_password_usecase.dart';
import 'package:mynt/domain/usecases/send_otp_usecase.dart';

part 'verification_state.dart';

@injectable
class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit(
      this._otpVerificationUsecase,
      this._sendOtpUsecase,
      this._editAccountDataUsecase,
      this._editEmailUsecase,
      this._editPhoneUsecase,
      this._resetPasswordUseCase)
      : super(VerificationInitial());
  final OtpVerificationUsecase _otpVerificationUsecase;
  final SendOtpUsecase _sendOtpUsecase;
  final EditAccountDataUsecase _editAccountDataUsecase;
  final EditEmailUsecase _editEmailUsecase;
  final EditPhoneUsecase _editPhoneUsecase;
  final ResetPasswordUseCase _resetPasswordUseCase;

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
        // showToast(
        //     'Verification failed. Please make sure the OTP is correct and try again.',
        //     ToastType.error);
        emit(VerificationError(failure.message));
        return false;
      },
      (success) {
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
        // showToast('Failed to send verification code. Please try again later.',
        //     ToastType.error);
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

  Future<bool> resetPassword({
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(CreatePasswordLoading());

    final res = await _resetPasswordUseCase(ResetPasswordRequest(
      login: email,
      password: newPassword,
      confirmPassword: confirmPassword,
    ));

    return await res.fold(
      (failure) {
        // showToast('Failed to reset password. Please try again later.',
        //     ToastType.error);
        emit(CreatePasswordError(failure.message));
        return false;
      },
      (_) {
        showToast(
            "Your password has been reset successfully. You can now log in with your new password.",
            ToastType.success);
        emit(CreatePasswordSuccess());
        return true;
      },
    );
  }

  Future<bool> editAccountData(String name, String gender) async {
    emit(EditAccountDataLoading());

    final result = await _editAccountDataUsecase(
        EditAccountDataRequest(name: name, gender: gender));
    return await result.fold(
      (failure) {
        // showToast('Failed to update account data, please try again.',
        //     ToastType.error);
        emit(EditAccountDataFailure(failure.message));
        return false;
      },
      (success) {
        showToast('Account data updated successfully.', ToastType.success);
        emit(EditAccountDataSuccess());
        return true;
      },
    );
  }

  Future<bool> editEmail(String email) async {
    emit(EditEmailLoading());

    final result = await _editEmailUsecase(EditEmailRequest(email: email));
    return await result.fold(
      (failure) {
        // showToast('Failed to update email, please try again.', ToastType.error);
        emit(EditEmailFailure(failure.message));
        return false;
      },
      (success) {
        showToast('Email updated successfully.', ToastType.success);
        emit(EditEmailSuccess());
        return true;
      },
    );
  }

  Future<bool> editPhone(String phoneNumber) async {
    emit(EditPhoneLoading());

    final result =
        await _editPhoneUsecase(EditPhoneRequest(phoneNumber: phoneNumber));
    return await result.fold(
      (failure) {
        // showToast('Failed to update Phone, please try again.', ToastType.error);
        emit(EditPhoneFailure(failure.message));
        return false;
      },
      (success) {
        showToast('Phone updated successfully.', ToastType.success);
        emit(EditPhoneSuccess());
        return true;
      },
    );
  }
}
