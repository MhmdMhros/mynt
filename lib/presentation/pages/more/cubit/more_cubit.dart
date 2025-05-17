import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/core/base_usecase.dart';
import 'package:mynt/core/user_secure_storage.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/di.dart';
import 'package:mynt/domain/entities/settings_data.dart';
import 'package:mynt/domain/usecases/logout_usecase.dart';
import 'package:mynt/domain/usecases/settings_data_usecase.dart';

part 'more_state.dart';

@injectable
class MoreCubit extends Cubit<MoreState> {
  MoreCubit(this._settingsDataUsecase, this._logoutUseCase)
      : super(MoreInitial());
  final SettingsDataUsecase _settingsDataUsecase;
  final LogoutUseCase _logoutUseCase;

  static MoreCubit get(BuildContext context) => BlocProvider.of(context);

  SettingsData? settingsData;

  Future<bool> getSettingsData() async {
    emit(GetSettingsDataLoading());
    final res = await _settingsDataUsecase(NoParams());
    return res.fold(
      (l) {
        emit(GetSettingsDataFailure(l.message));
        return false;
      },
      (settingsData) {
        this.settingsData = settingsData;
        emit(GetSettingsDataSuccess());
        return true;
      },
    );
  }

  Future<bool> logout() async {
    emit(LogoutLoading());
    final deviceToken = await getIt<UserSecureStorage>().getDeviceToken();
    final deviceType = await getIt<UserSecureStorage>().getDeviceType();

    final res = await _logoutUseCase(
        LogoutRequest(deviceToken: deviceToken!, deviceType: deviceType!));
    return await res.fold(
      (l) {
        emit(LogoutFailure(l.message));
        return false;
      },
      (r) async {
        await getIt<UserSecureStorage>().deleteUserInfo();
        emit(LogoutSuccess());
        return true;
      },
    );
  }
}
