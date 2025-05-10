// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:mynt/core/app_prefs/app_prefs.dart' as _i33;
import 'package:mynt/core/app_prefs/shared_prefs_injectable.dart' as _i111;
import 'package:mynt/core/network/dio_factory.dart' as _i110;
import 'package:mynt/core/user_secure_storage.dart' as _i27;
import 'package:mynt/data/datasources/local_datasource/local_datasource.dart'
    as _i79;
import 'package:mynt/data/datasources/remote_datasource/app_api.dart' as _i3;
import 'package:mynt/data/datasources/remote_datasource/remote_modules.dart'
    as _i109;
import 'package:mynt/data/repository/repository.dart' as _i9;
import 'package:mynt/domain/repository/repository.dart' as _i8;

import 'package:mynt/domain/usecases/login_usecase.dart' as _i1001;
import 'package:mynt/domain/usecases/check_account_usecase.dart' as _i1002;
import 'package:mynt/domain/usecases/send_otp_usecase.dart' as _i1003;
import 'package:mynt/domain/usecases/otp_verification_usecase.dart' as _i1004;
import 'package:mynt/domain/usecases/get_user_usecase.dart' as _i1005;
import 'package:mynt/domain/usecases/refresh_token_usecase.dart' as _i1006;
import 'package:mynt/domain/usecases/reset_password_usecase.dart' as _i1007;
import 'package:mynt/domain/usecases/settings_data_usecase.dart' as _i1008;
import 'package:mynt/domain/usecases/logout_usecase.dart' as _i1009;
import 'package:mynt/domain/usecases/edit_account_data_usecase.dart' as _i1010;
import 'package:mynt/domain/usecases/edit_email_usecase.dart' as _i1011;
import 'package:mynt/domain/usecases/edit_phone_usecase.dart' as _i1012;

import 'package:mynt/presentation/pages/sign in/cubit/login_cubit.dart'
    as _i2000;
import 'package:mynt/presentation/pages/layout/cubit/layout_cubit.dart'
    as _i2001;
import 'package:mynt/presentation/pages/email verification/cubit/verification_cubit.dart'
    as _i2003;

import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableAppServiceClientModule =
        _$InjectableAppServiceClientModule();
    final injectableDioModule = _$InjectableDioModule();
    final injectableUserSecureStorageModule =
        _$InjectableUserSecureStorageModule();
    final sharedPrefsInjectableModule = _$SharedPrefsInjectableModule();
    gh.lazySingleton<_i3.AppServiceClient>(
        () => injectableAppServiceClientModule.appServiceClient);
    gh.lazySingleton<_i4.Dio>(() => injectableDioModule.dio);
    gh.lazySingleton<_i5.FlutterSecureStorage>(
        () => injectableUserSecureStorageModule.secureStorage);

    gh.factory<_i8.Repository>(
        () => _i9.RepositoryImpl(gh<_i3.AppServiceClient>()));
    // gh.lazySingleton<_i10.ResendEmailVerificationUseCase>(
    //     () => _i10.ResendEmailVerificationUseCase(gh<_i8.Repository>()));
    // gh.lazySingleton<_i11.ResetPasswordUseCase>(
    //     () => _i11.ResetPasswordUseCase(gh<_i8.Repository>()));
    await gh.factoryAsync<_i13.SharedPreferences>(
      () => sharedPrefsInjectableModule.prefs,
      preResolve: true,
    );
    // gh.lazySingleton<_i14.SignupUseCase>(
    //     () => _i14.SignupUseCase(gh<_i8.Repository>()));

    // gh.lazySingleton<_i22.UpdateUserUseCase>(
    //     () => _i22.UpdateUserUseCase(gh<_i8.Repository>()));
    gh.factory<_i27.UserSecureStorage>(
        () => _i27.UserSecureStorage(gh<_i5.FlutterSecureStorage>()));
    // gh.lazySingleton<_i29.VerifyResetPasswordOtpUseCase>(
    //     () => _i29.VerifyResetPasswordOtpUseCase(gh<_i8.Repository>()));
    gh.factory<_i33.AppPreferences>(
        () => _i33.AppPreferences(gh<_i13.SharedPreferences>()));

    // gh.factory<_i38.CreateNewPasswordCubit>(
    //     () => _i38.CreateNewPasswordCubit(gh<_i11.ResetPasswordUseCase>()));
    // gh.lazySingleton<_i45.DeleteAccountUseCase>(
    //     () => _i45.DeleteAccountUseCase(gh<_i8.Repository>()));
    // gh.lazySingleton<_i57.ForgetPasswordUseCase>(
    //     () => _i57.ForgetPasswordUseCase(gh<_i8.Repository>()));

    // gh.lazySingleton<_i74.GetProviderDataUseCase>(
    //     () => _i74.GetProviderDataUseCase(gh<_i8.Repository>()));
    // gh.lazySingleton<_i76.GetUserUseCase>(
    //     () => _i76.GetUserUseCase(gh<_i8.Repository>()));
    gh.factory<_i79.LocalDataSource>(
        () => _i79.LocalDataSource(gh<_i13.SharedPreferences>()));

    // gh.lazySingleton<_i81.LogoutUseCase>(
    //     () => _i81.LogoutUseCase(gh<_i8.Repository>()));
    // gh.factory<_i82.MainCubit>(
    //     () => _i82.MainCubit(gh<_i74.GetProviderDataUseCase>()));
    // gh.factory<_i84.MoreCubit>(() => _i84.MoreCubit(gh<_i81.LogoutUseCase>()));
    // gh.factory<_i91.SignupCubit>(
    //     () => _i91.SignupCubit(gh<_i14.SignupUseCase>()));
    // gh.factory<_i92.SignupStepsCubit>(
    //     () => _i92.SignupStepsCubit(gh<_i22.UpdateUserUseCase>()));
    // gh.factory<_i93.VerificationCodeCubit>(() => _i93.VerificationCodeCubit(
    //       gh<_i10.ResendEmailVerificationUseCase>(),
    //       gh<_i80.LoginUseCase>(),
    //       gh<_i76.GetUserUseCase>(),
    //     ));
    // gh.factory<_i94.VerifyResetPasswordOtpCubit>(() =>
    //     _i94.VerifyResetPasswordOtpCubit(
    //         gh<_i29.VerifyResetPasswordOtpUseCase>()));
    // gh.factory<_i106.ForgetPasswordCubit>(
    //     () => _i106.ForgetPasswordCubit(gh<_i57.ForgetPasswordUseCase>()));
    // gh.factory<_i107.LoginCubit>(
    //     () => _i107.LoginCubit(gh<_i80.LoginUseCase>()));

    gh.lazySingleton<_i1001.LoginUseCase>(
        () => _i1001.LoginUseCase(gh<_i8.Repository>()));

    gh.lazySingleton<_i1002.CheckAccountUsecase>(
        () => _i1002.CheckAccountUsecase(gh<_i8.Repository>()));

    gh.lazySingleton<_i1003.SendOtpUsecase>(
        () => _i1003.SendOtpUsecase(gh<_i8.Repository>()));

    gh.lazySingleton<_i1004.OtpVerificationUsecase>(
        () => _i1004.OtpVerificationUsecase(gh<_i8.Repository>()));

    gh.factory<_i2000.LoginCubit>(() => _i2000.LoginCubit(
          gh<_i1001.LoginUseCase>(),
          gh<_i1002.CheckAccountUsecase>(),
          gh<_i1003.SendOtpUsecase>(),
        ));

    gh.lazySingleton<_i1010.EditAccountDataUsecase>(
        () => _i1010.EditAccountDataUsecase(gh<_i8.Repository>()));

    gh.lazySingleton<_i1011.EditEmailUsecase>(
        () => _i1011.EditEmailUsecase(gh<_i8.Repository>()));

    gh.lazySingleton<_i1012.EditPhoneUsecase>(
        () => _i1012.EditPhoneUsecase(gh<_i8.Repository>()));

    gh.lazySingleton<_i1007.ResetPasswordUseCase>(
        () => _i1007.ResetPasswordUseCase(gh<_i8.Repository>()));

    gh.factory<_i2003.VerificationCubit>(() => _i2003.VerificationCubit(
          gh<_i1004.OtpVerificationUsecase>(),
          gh<_i1003.SendOtpUsecase>(),
          gh<_i1010.EditAccountDataUsecase>(),
          gh<_i1011.EditEmailUsecase>(),
          gh<_i1012.EditPhoneUsecase>(),
          gh<_i1007.ResetPasswordUseCase>(),
        ));

    gh.lazySingleton<_i1005.GetUserUseCase>(
        () => _i1005.GetUserUseCase(gh<_i8.Repository>()));

    gh.lazySingleton<_i1006.RefreshTokenUsecase>(
        () => _i1006.RefreshTokenUsecase(gh<_i8.Repository>()));

    gh.lazySingleton<_i1008.SettingsDataUsecase>(
        () => _i1008.SettingsDataUsecase(gh<_i8.Repository>()));

    gh.lazySingleton<_i1009.LogoutUseCase>(
        () => _i1009.LogoutUseCase(gh<_i8.Repository>()));

    gh.factory<_i2001.LayoutCubit>(() => _i2001.LayoutCubit(
          gh<_i1005.GetUserUseCase>(),
          gh<_i1006.RefreshTokenUsecase>(),
          gh<_i1008.SettingsDataUsecase>(),
          gh<_i1009.LogoutUseCase>(),
          gh<_i1003.SendOtpUsecase>(),
        ));

    return this;
  }
}

class _$InjectableAppServiceClientModule
    extends _i109.InjectableAppServiceClientModule {}

class _$InjectableDioModule extends _i110.InjectableDioModule {}

class _$InjectableUserSecureStorageModule
    extends _i27.InjectableUserSecureStorageModule {}

class _$SharedPrefsInjectableModule extends _i111.SharedPrefsInjectableModule {}
