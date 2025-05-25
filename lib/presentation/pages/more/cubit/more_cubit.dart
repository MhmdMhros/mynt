import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/core/base_usecase.dart';
import 'package:mynt/core/user_secure_storage.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/di.dart';
import 'package:mynt/domain/entities/settings_data.dart';
import 'package:mynt/domain/entities/settings_data_without_slug.dart';
import 'package:mynt/domain/usecases/logout_usecase.dart';
import 'package:mynt/domain/usecases/settings_data_usecase.dart';
import 'package:mynt/domain/usecases/settings_data_without_slugs_usecase.dart';

part 'more_state.dart';

@injectable
class MoreCubit extends Cubit<MoreState> {
  MoreCubit(this._settingsDataUsecase, this._logoutUseCase,
      this._settingsDataWithoutSlugsUsecase)
      : super(MoreInitial());
  final SettingsDataUsecase _settingsDataUsecase;
  final LogoutUseCase _logoutUseCase;
  final SettingsDataWithoutSlugsUsecase _settingsDataWithoutSlugsUsecase;

  static MoreCubit get(BuildContext context) => BlocProvider.of(context);

  SettingsData? settingsData;
  SettingsDataWithoutSlug? settingsDataWithoutSlug;

  Future<bool> getSettingsData() async {
    if (!isClosed) emit(GetSettingsDataLoading());
    final res = await _settingsDataUsecase(NoParams());
    return res.fold(
      (l) {
        if (!isClosed) emit(GetSettingsDataFailure(l.message));
        return false;
      },
      (settingsData) {
        this.settingsData = settingsData;
        if (!isClosed) emit(GetSettingsDataSuccess());
        return true;
      },
    );
  }

  Future<bool> getSettingsDataWithoutSlugs() async {
    if (!isClosed) emit(GetSettingsDataWithoutSlugsLoading());
    final res = await _settingsDataWithoutSlugsUsecase(NoParams());
    return res.fold(
      (l) {
        if (!isClosed) emit(GetSettingsDataWithoutSlugsFailure(l.message));
        return false;
      },
      (settingsDataWithoutSlug) {
        this.settingsDataWithoutSlug = settingsDataWithoutSlug;
        if (!isClosed) emit(GetSettingsDataWithoutSlugsSuccess());
        return true;
      },
    );
  }

  Future<bool> logout() async {
    if (!isClosed) emit(LogoutLoading());
    final deviceToken = await getIt<UserSecureStorage>().getDeviceToken();
    final deviceType = await getIt<UserSecureStorage>().getDeviceType();

    final res = await _logoutUseCase(
        LogoutRequest(deviceToken: deviceToken!, deviceType: deviceType!));
    return await res.fold(
      (l) {
        if (!isClosed) emit(LogoutFailure(l.message));
        return false;
      },
      (r) async {
        await getIt<UserSecureStorage>().deleteUserInfo();
        if (!isClosed) emit(LogoutSuccess());
        return true;
      },
    );
  }
}
