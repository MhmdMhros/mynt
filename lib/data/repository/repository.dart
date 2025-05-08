import 'package:mynt/domain/entities/send_otp.dart';

import 'package:dio/dio.dart';

import '../../core/models/no_data.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/logout_success.dart';
import '../../domain/entities/reset_password_success.dart';
import '../../domain/entities/verify_reset_password_otp_success.dart';
import '../../domain/entities/forget_password_success.dart';
import '../../core/user_secure_storage.dart';
import '../../di.dart';
import '../../domain/entities/login_success.dart';
import '../../domain/entities/resend_email_verification_success.dart';
import '../../domain/entities/otp_verification_success.dart';
import '../../domain/entities/signup_success.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/core/helpers/repository_helpers.dart';
import 'package:mynt/data/datasources/remote_datasource/app_api.dart';
import 'package:mynt/domain/repository/repository.dart';
// ignore: unused_import
import 'package:dartz/dartz.dart';
// ignore: unused_import
import '../../core/network/failure.dart';
// ignore: unused_import
import '../requests/requests.dart';

@Injectable(as: Repository)
class RepositoryImpl implements Repository {
  final AppServiceClient _appServiceClient;
  final RepositoryHelpers _repositoryHelpers;
  int? userId;
  String? accessToken;
  String? refreshToken;

  RepositoryImpl(this._appServiceClient)
      : _repositoryHelpers = RepositoryHelpers() {
    initUserId();
  }

  Future<void> initUserId([int? id]) async {
    userId = id ?? await getIt<UserSecureStorage>().getUserId() ?? 0;
  }

  Future<void> initAccessToken([String? token]) async {
    accessToken =
        token ?? await getIt<UserSecureStorage>().getUserAccessToken() ?? '';
  }

  Future<void> initRefreshToken([String? token]) async {
    refreshToken =
        token ?? await getIt<UserSecureStorage>().getRefreshToken() ?? '';
  }

  Future<void> _storeUserData(
      LoginSuccess loginData, LoginRequest loginRequest) async {
    await initUserId(loginData.userId);
    await getIt<UserSecureStorage>().upsertUserInfo(
      userId: loginData.userId,
      email: loginRequest.userName,
      password: loginRequest.password,
      accessToken: loginData.accessToken,
      refreshToken: loginData.refreshToken,
      expiresIn: loginData.expiresIn,
    );
  }

  @override
  Future<Either<Failure, NoData>> uploadFile(
      UploadFileRequest uploadFileRequest) async {
    return _repositoryHelpers.callApi<NoData>(
      () => AppServiceClient(
        getIt<Dio>(),
        baseUrl: uploadFileRequest.url,
      ).uploadFile(uploadFileRequest),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, SignupSuccess>> signup(
    SignupRequest signupRequest,
  ) async {
    return _repositoryHelpers.callApi<SignupSuccess>(
      () => _appServiceClient.signup(
        signupRequest,
      ),
      statusCode: 201,
    );
  }

  @override
  Future<Either<Failure, OtpVerificationSuccess>> otpVerification(
    OtpVerificationRequest otpVerificationRequest,
  ) async {
    return _repositoryHelpers.callApi<OtpVerificationSuccess>(
      () => _appServiceClient.otpVerification(
        otpVerificationRequest,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, ResendEmailVerificationSuccess>>
      resendEmailVerification(
    ResendEmailVerificationRequest resendEmailVerificationRequest,
  ) async {
    return _repositoryHelpers.callApi<ResendEmailVerificationSuccess>(
      () => _appServiceClient.resendEmailVerification(
        resendEmailVerificationRequest,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, LoginSuccess>> login(
    LoginRequest loginRequest,
  ) async {
    return _repositoryHelpers.callApi<LoginSuccess>(
      () => _appServiceClient.login(
        loginRequest,
      ),
      statusCode: 200,
      onData: (data) => _storeUserData(
        data,
        loginRequest,
      ),
    );
  }

  @override
  Future<Either<Failure, NoData>> checkAccount(
    CheckAccountRequest checkAccountRequest,
  ) async {
    return _repositoryHelpers.callApi<NoData>(
      () => _appServiceClient.checkAccount(
        checkAccountRequest,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, SendOtp>> sendOtp(
    SendOtpRequest sendOtpRequest,
  ) async {
    final result = await _repositoryHelpers.callApi<SendOtp>(
      () => _appServiceClient.sendOtp(sendOtpRequest),
      statusCode: 201,
    );

    if (result.isLeft()) {
      await getIt<UserSecureStorage>().deleteUserInfo();
    }

    return result;
  }

  @override
  Future<Either<Failure, ForgetPasswordSuccess>> forgetPassword(
    ForgetPasswordRequest forgetPasswordRequest,
  ) async {
    return _repositoryHelpers.callApi<ForgetPasswordSuccess>(
      () => _appServiceClient.forgetPassword(
        forgetPasswordRequest,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, VerifyResetPasswordOtpSuccess>> verifyResetPasswordOtp(
    VerifyResetPasswordOtpRequest verifyResetPasswordOtpRequest,
  ) async {
    return _repositoryHelpers.callApi<VerifyResetPasswordOtpSuccess>(
      () => _appServiceClient.verifyResetPasswordOtp(
        verifyResetPasswordOtpRequest,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, ResetPasswordSuccess>> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  ) async {
    return _repositoryHelpers.callApi<ResetPasswordSuccess>(
      () => _appServiceClient.resetPassword(
        resetPasswordRequest,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, User>> getUser() async {
    if (userId == null) initUserId();
    return _repositoryHelpers.callApi<User>(
      () => _appServiceClient.getUser(userId.toString()),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, LogoutSuccess>> logout() async {
    return _repositoryHelpers.callApi<LogoutSuccess>(
      () => _appServiceClient.logout(),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, User>> updateUser(
    UpdateUserRequest updateProviderRequest,
  ) async {
    return _repositoryHelpers.callApi<User>(
      () => _appServiceClient.updateUser(
        updateProviderRequest.id,
        updateProviderRequest.firstName,
        updateProviderRequest.lastName,
        updateProviderRequest.businessName,
        updateProviderRequest.phoneNumber,
        updateProviderRequest.about,
        updateProviderRequest.trainingSince,
        updateProviderRequest.servicesOffered,
        updateProviderRequest.gender,
        updateProviderRequest.email,
        updateProviderRequest.city,
        updateProviderRequest.photo,
        updateProviderRequest.cover,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, User>> getProviderData() async {
    await initUserId();
    return _repositoryHelpers.callApi<User>(
      () => _appServiceClient.getProviderData(
        userId.toString(),
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, NoData>> deleteAccount() async {
    return _repositoryHelpers.callApi<NoData>(
      () => _appServiceClient.deleteAccount(
        accessToken!,
      ),
      statusCode: 200,
    );
  }
}
