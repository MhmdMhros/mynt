import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/app/functions.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/domain/usecases/reset_password_usecase.dart';

part 'create_password_state.dart';

@injectable
class CreatePasswordCubit extends Cubit<CreatePasswordState> {
  CreatePasswordCubit(this._resetPasswordUseCase)
      : super(CreatePasswordInitial());
  final ResetPasswordUseCase _resetPasswordUseCase;

  static CreatePasswordCubit get(BuildContext context) =>
      BlocProvider.of(context);

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
        showToast('Failed to reset password. Please try again later.',
            ToastType.error);
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
}
