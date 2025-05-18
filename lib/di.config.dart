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
import 'package:mynt/domain/usecases/get_home_data_usecase.dart' as _i1013;
import 'package:mynt/domain/usecases/get_notifications_data_usecase.dart'
    as _i1014;
import 'package:mynt/domain/usecases/read_notification_usecase.dart' as _i1015;
import 'package:mynt/domain/usecases/get_bookings_data_usecase.dart' as _i1016;
import 'package:mynt/domain/usecases/get_tickets_data_usecase.dart' as _i1017;
import 'package:mynt/domain/usecases/create_review_usecase.dart' as _i1018;
import 'package:mynt/domain/usecases/create_restriction_usecase.dart' as _i1019;
import 'package:mynt/domain/usecases/get_un_read_notifications_count_usecase.dart'
    as _i1020;
import 'package:mynt/domain/usecases/get_all_account_summary_usecase.dart'
    as _i1021;
import 'package:mynt/domain/usecases/get_booking_account_summary_usecase.dart'
    as _i1022;
import 'package:mynt/domain/usecases/create_ticket_usecase.dart' as _i1023;
import 'package:mynt/domain/usecases/get_request_service_data_usecase.dart'
    as _i1024;
import 'package:mynt/domain/usecases/upload_ticket_images_usecase.dart'
    as _i1025;
import 'package:mynt/domain/usecases/download_pdf_all_account_summary_usecase.dart'
    as _i1026;
import 'package:mynt/domain/usecases/download_excel_all_account_summary_usecase.dart'
    as _i1027;
import 'package:mynt/domain/usecases/download_pdf_booking_account_summary_usecase.dart'
    as _i1028;
import 'package:mynt/domain/usecases/download_excel_booking_account_summary_usecase.dart'
    as _i1029;

import 'package:mynt/presentation/pages/sign in/cubit/login_cubit.dart'
    as _i2000;
import 'package:mynt/presentation/pages/layout/cubit/layout_cubit.dart'
    as _i2001;
import 'package:mynt/presentation/pages/email verification/cubit/verification_cubit.dart'
    as _i2003;
import 'package:mynt/presentation/pages/dashboard/cubit/dashboard_cubit.dart'
    as _i2004;
import 'package:mynt/presentation/pages/units/cubit/units_cubit.dart' as _i2005;
import 'package:mynt/presentation/pages/notifications/cubit/notifications_cubit.dart'
    as _i2006;
import 'package:mynt/presentation/pages/tickets/cubit/tickets_cubit.dart'
    as _i2007;
import 'package:mynt/presentation/pages/balances/cubit/balances_cubit.dart'
    as _i2008;
import 'package:mynt/presentation/pages/request service/cubit/request_service_cubit.dart'
    as _i2009;
import 'package:mynt/presentation/pages/more/cubit/more_cubit.dart' as _i2010;

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

    gh.lazySingleton<_i1013.GetHomeDataUsecase>(
        () => _i1013.GetHomeDataUsecase(gh<_i8.Repository>()));

    gh.lazySingleton<_i1020.GetUnReadNotificationsCountUsecase>(
        () => _i1020.GetUnReadNotificationsCountUsecase(gh<_i8.Repository>()));

    gh.lazySingleton<_i1021.GetAllAccountSummaryUsecase>(
        () => _i1021.GetAllAccountSummaryUsecase(gh<_i8.Repository>()));

    gh.factory<_i2001.LayoutCubit>(() => _i2001.LayoutCubit(
          gh<_i1005.GetUserUseCase>(),
          gh<_i1006.RefreshTokenUsecase>(),
          gh<_i1003.SendOtpUsecase>(),
        ));

    gh.factory<_i2004.DashboardCubit>(() => _i2004.DashboardCubit(
          gh<_i1013.GetHomeDataUsecase>(),
          gh<_i1020.GetUnReadNotificationsCountUsecase>(),
          gh<_i1021.GetAllAccountSummaryUsecase>(),
        ));

    gh.lazySingleton<_i1016.GetBookingsDataUsecase>(
        () => _i1016.GetBookingsDataUsecase(gh<_i8.Repository>()));
    gh.lazySingleton<_i1019.CreateRestrictionUsecase>(
        () => _i1019.CreateRestrictionUsecase(gh<_i8.Repository>()));
    gh.lazySingleton<_i1022.GetBookingAccountSummaryUsecase>(
        () => _i1022.GetBookingAccountSummaryUsecase(gh<_i8.Repository>()));

    gh.factory<_i2005.UnitsCubit>(() => _i2005.UnitsCubit(
          gh<_i1016.GetBookingsDataUsecase>(),
          gh<_i1019.CreateRestrictionUsecase>(),
          gh<_i1022.GetBookingAccountSummaryUsecase>(),
        ));

    gh.lazySingleton<_i1017.GetTicketsDataUsecase>(
        () => _i1017.GetTicketsDataUsecase(gh<_i8.Repository>()));

    gh.lazySingleton<_i1018.CreateReviewUsecase>(
        () => _i1018.CreateReviewUsecase(gh<_i8.Repository>()));

    gh.factory<_i2007.TicketsCubit>(() => _i2007.TicketsCubit(
          gh<_i1017.GetTicketsDataUsecase>(),
          gh<_i1018.CreateReviewUsecase>(),
        ));

    gh.factory<_i2010.MoreCubit>(() => _i2010.MoreCubit(
          gh<_i1008.SettingsDataUsecase>(),
          gh<_i1009.LogoutUseCase>(),
        ));

    gh.lazySingleton<_i1014.GetNotificationsDataUsecase>(
        () => _i1014.GetNotificationsDataUsecase(gh<_i8.Repository>()));

    gh.lazySingleton<_i1015.ReadNotificationUsecase>(
        () => _i1015.ReadNotificationUsecase(gh<_i8.Repository>()));

    gh.factory<_i2006.NotificationsCubit>(() => _i2006.NotificationsCubit(
          gh<_i1014.GetNotificationsDataUsecase>(),
          gh<_i1015.ReadNotificationUsecase>(),
        ));

    gh.lazySingleton<_i1026.DownloadPdfAllAccountSummaryUsecase>(
        () => _i1026.DownloadPdfAllAccountSummaryUsecase(gh<_i8.Repository>()));

    gh.lazySingleton<_i1027.DownloadExcelAllAccountSummaryUsecase>(() =>
        _i1027.DownloadExcelAllAccountSummaryUsecase(gh<_i8.Repository>()));

    gh.lazySingleton<_i1028.DownloadPdfBookingAccountSummaryUsecase>(() =>
        _i1028.DownloadPdfBookingAccountSummaryUsecase(gh<_i8.Repository>()));

    gh.lazySingleton<_i1029.DownloadExcelBookingAccountSummaryUsecase>(() =>
        _i1029.DownloadExcelBookingAccountSummaryUsecase(gh<_i8.Repository>()));

    gh.factory<_i2008.BalancesCubit>(() => _i2008.BalancesCubit(
          gh<_i1026.DownloadPdfAllAccountSummaryUsecase>(),
          gh<_i1027.DownloadExcelAllAccountSummaryUsecase>(),
          gh<_i1028.DownloadPdfBookingAccountSummaryUsecase>(),
          gh<_i1029.DownloadExcelBookingAccountSummaryUsecase>(),
        ));

    gh.lazySingleton<_i1023.CreateTicketUsecase>(
        () => _i1023.CreateTicketUsecase(gh<_i8.Repository>()));

    gh.lazySingleton<_i1024.GetRequestServiceDataUsecase>(
        () => _i1024.GetRequestServiceDataUsecase(gh<_i8.Repository>()));

    gh.lazySingleton<_i1025.UploadTicketImagesUsecase>(
        () => _i1025.UploadTicketImagesUsecase(gh<_i8.Repository>()));

    gh.factory<_i2009.RequestServiceCubit>(() => _i2009.RequestServiceCubit(
          gh<_i1024.GetRequestServiceDataUsecase>(),
          gh<_i1023.CreateTicketUsecase>(),
          gh<_i1025.UploadTicketImagesUsecase>(),
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
