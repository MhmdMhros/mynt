// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/app/functions.dart';
import 'package:mynt/core/base_usecase.dart';
import 'package:mynt/core/user_secure_storage.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/di.dart';
import 'package:mynt/domain/entities/user.dart';
import 'package:mynt/domain/usecases/edit_account_data_usecase.dart';
import 'package:mynt/domain/usecases/get_user_usecase.dart';
import 'package:mynt/domain/usecases/send_otp_usecase.dart';

part 'my_profile_state.dart';

@injectable
class MyProfileCubit extends Cubit<MyProfileState> {
  MyProfileCubit(
      this._getUserUseCase, this._sendOtpUsecase, this._editAccountDataUsecase)
      : super(MyProfileInitial());
  final GetUserUseCase _getUserUseCase;
  final SendOtpUsecase _sendOtpUsecase;
  final EditAccountDataUsecase _editAccountDataUsecase;

  static MyProfileCubit get(BuildContext context) => BlocProvider.of(context);

  User? user;

  Future<int> getUser() async {
    emit(MyProfileGetUserLoading());
    final res = await _getUserUseCase(NoParams());
    return await res.fold(
      (l) {
        emit(MyProfileGetUserFailure(l.message));
        // showToast(l.code.toString(), ToastType.info);
        return l.code;
      },
      (user) {
        this.user = user;
        emit(MyProfileGetUserSuccess());
        return 200;
      },
    );
  }

  Future<bool> sendOtp(String userName) async {
    final result = await _sendOtpUsecase(
      SendOtpRequest(identifier: userName),
    );
    return await result.fold(
      (failure) {
        // showToast('Failed to send verification code. Please try again later.',
        //     ToastType.error);
        emit(MyProfileSendOtpError(failure.message));
        return false;
      },
      (success) {
        emit(MyProfileSendOtpSuccess());
        return true;
      },
    );
  }

  Future<void> editData() async {
    final success = await getUser();
    if (success == 200) {
      await getIt<UserSecureStorage>().upsertUserInfo(
        email: user!.email,
      );
      // showToast('Doneeeeeeeeeeeeeeeeeeeeee.', ToastType.success);
    }
  }

  Future<bool> editAccountData(String name, String gender) async {
    emit(MyProfileEditAccountDataLoading());

    final result = await _editAccountDataUsecase(
        EditAccountDataRequest(name: name, gender: gender));
    return await result.fold(
      (failure) {
        // showToast('Failed to update account data, please try again.',
        //     ToastType.error);
        emit(MyProfileEditAccountDataFailure(failure.message));
        return false;
      },
      (success) {
        showToast('Account data updated successfully.', ToastType.success);
        emit(MyProfileEditAccountDataSuccess());
        return true;
      },
    );
  }
}
