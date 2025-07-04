import 'package:mynt/domain/entities/account_summary_data.dart';
import 'package:mynt/domain/entities/booking.dart';
import 'package:mynt/domain/entities/bookings_data.dart';
import 'package:mynt/domain/entities/create_ticket_success.dart';
import 'package:mynt/domain/entities/dashboard_data.dart';
import 'package:mynt/domain/entities/download_excel_success.dart';
import 'package:mynt/domain/entities/download_pdf_success.dart';
import 'package:mynt/domain/entities/images_data.dart';
import 'package:mynt/domain/entities/notifications_data.dart';
import 'package:mynt/domain/entities/refresh_token_success.dart';
import 'package:mynt/domain/entities/request_service_data.dart';
import 'package:mynt/domain/entities/restriction_success.dart';
import 'package:mynt/domain/entities/review_success.dart';
import 'package:mynt/domain/entities/send_otp.dart';

import 'package:dio/dio.dart';
import 'package:mynt/domain/entities/settings_data.dart';
import 'package:mynt/domain/entities/settings_data_without_slug.dart';
import 'package:mynt/domain/entities/tickets_data.dart';
import 'package:mynt/domain/entities/un_read_notifications_count.dart';

import '../../core/models/no_data.dart';
import '../../domain/entities/user.dart';
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

  RepositoryImpl(this._appServiceClient)
      : _repositoryHelpers = RepositoryHelpers() {
    // initUserId();
    // initAccessToken();
    // initRefreshToken();
  }

  // Future<void> initUserId([int? id]) async {
  //   userId = id ?? await getIt<UserSecureStorage>().getUserId() ?? 0;
  // }

  // Future<void> initAccessToken([String? token]) async {
  //   accessToken =
  //       token ?? await getIt<UserSecureStorage>().getUserAccessToken() ?? '';
  // }

  // Future<void> initRefreshToken([String? token]) async {
  //   refreshTokenVal =
  //       token ?? await getIt<UserSecureStorage>().getRefreshToken() ?? '';
  // }

  Future<void> _storeUserData(
      LoginSuccess loginData, LoginRequest loginRequest) async {
    // await initUserId(loginData.userId);
    // await initAccessToken(loginData.accessToken);
    // await initRefreshToken(loginData.refreshToken);
    await getIt<UserSecureStorage>().upsertUserInfo(
      userId: loginData.userId,
      email: loginRequest.userName,
      password: loginRequest.password,
      accessToken: loginData.accessToken,
      refreshToken: loginData.refreshToken,
      expiresIn: loginData.expiresIn,
      deviceToken: loginRequest.deviceToken,
      deviceType: loginRequest.deviceType,
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
  Future<Either<Failure, RefreshTokenSuccess>> refreshToken(
    RefreshTokenRequest refreshTokenRequest,
  ) async {
    return _repositoryHelpers.callApi<RefreshTokenSuccess>(
      () => _appServiceClient.refreshToken(
        refreshTokenRequest,
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
    final accessToken = await getIt<UserSecureStorage>().getUserAccessToken();
    return _repositoryHelpers.callApi<User>(
      () => _appServiceClient.getUser(accessToken ?? ''),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, NoData>> logout(LogoutRequest logoutRequest) async {
    final accessToken = await getIt<UserSecureStorage>().getUserAccessToken();
    return _repositoryHelpers.callApi<NoData>(
      () => _appServiceClient.logout(accessToken!, logoutRequest),
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
  Future<Either<Failure, NoData>> deleteAccount() async {
    final accessToken = await getIt<UserSecureStorage>().getUserAccessToken();
    return _repositoryHelpers.callApi<NoData>(
      () => _appServiceClient.deleteAccount(
        accessToken!,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, NoData>> editAccountData(
      EditAccountDataRequest editAccountDataRequest) async {
    return _repositoryHelpers.callApi<NoData>(
      () => _appServiceClient.editAccountData(
        editAccountDataRequest,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, NoData>> editAccountEmail(
      EditEmailRequest editEmailRequest) async {
    return _repositoryHelpers.callApi<NoData>(
      () => _appServiceClient.editAccountEmail(
        editEmailRequest,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, NoData>> editAccountPhone(
      EditPhoneRequest editPhoneRequest) async {
    return _repositoryHelpers.callApi<NoData>(
      () => _appServiceClient.editAccountPhone(
        editPhoneRequest,
      ),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, SettingsData>> settingsData() async {
    return _repositoryHelpers.callApi<SettingsData>(
      () => _appServiceClient.settingsData(),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, SettingsDataWithoutSlug>>
      settingsDataWithoutSlugs() async {
    return _repositoryHelpers.callApi<SettingsDataWithoutSlug>(
      () => _appServiceClient.settingsDataWithoutSlugs(),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, DashboardData>> dashboardData() async {
    return _repositoryHelpers.callApi<DashboardData>(
      () => _appServiceClient.getHomeData(),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, NotificationsData>> notificationsData(
    GetAllNotificationsRequest getAllNotificationsRequest,
  ) async {
    return _repositoryHelpers.callApi<NotificationsData>(
      () =>
          _appServiceClient.getNotifications(getAllNotificationsRequest.query),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, BookingsData>> bookingsData(
    GetAllUnitsRequest getAllUnitsRequest,
  ) async {
    return _repositoryHelpers.callApi<BookingsData>(
      () => _appServiceClient.getBookings(getAllUnitsRequest.query),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, TicketsData>> ticketsData(
    GetAllTicketsRequest getAllTicketsRequest,
  ) async {
    return _repositoryHelpers.callApi<TicketsData>(
      () => _appServiceClient.getTickets(getAllTicketsRequest.query),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, Booking>> getBookingDetails(
    String bookingId,
  ) async {
    return _repositoryHelpers.callApi<Booking>(
      () => _appServiceClient.getBookingDetails(bookingId),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, RestrictionSuccess>> createRestriction(
    CreateRestrictionRequest createRestrictionRequest,
  ) async {
    return _repositoryHelpers.callApi<RestrictionSuccess>(
      () => _appServiceClient.createRestriction(createRestrictionRequest),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, ReviewSuccess>> createReview(
    CreateReviewRequest createReviewRequest,
  ) async {
    return _repositoryHelpers.callApi<ReviewSuccess>(
      () => _appServiceClient.createReview(createReviewRequest),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, CreateTicketSuccess>> createTicket(
    CreateTicketRequest createTicketRequest,
  ) async {
    return _repositoryHelpers.callApi<CreateTicketSuccess>(
      () => _appServiceClient.createTicket(createTicketRequest),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, AccountSummaryData>> allAccountSummaryData() async {
    return _repositoryHelpers.callApi<AccountSummaryData>(
      () => _appServiceClient.getAllAccountSummary(),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, AccountSummaryData>> bookingAccountSummaryData(
    GetBookingAccountSummaryRequest getBookingAccountSummaryRequest,
  ) async {
    return _repositoryHelpers.callApi<AccountSummaryData>(
      () => _appServiceClient
          .getBookingAccountSummary(getBookingAccountSummaryRequest.query),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, NoData>> readNotification(
    String notificationId,
  ) async {
    return _repositoryHelpers.callApi<NoData>(
      () => _appServiceClient.readNotification(notificationId),
      statusCode: 204,
    );
  }

  @override
  Future<Either<Failure, UnReadNotificationsCount>>
      getUnReadNotificationsCount() async {
    return _repositoryHelpers.callApi<UnReadNotificationsCount>(
      () => _appServiceClient.getUnReadNotificationsCount(),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, RequestServiceData>> requestServiceData() async {
    return _repositoryHelpers.callApi<RequestServiceData>(
      () => _appServiceClient.getRequestServiceData(),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, ImagesData>> uploadTicketImages(
    UploadImagesRequest uploadImagesRequest,
  ) async {
    return _repositoryHelpers.callApi<ImagesData>(
      () => _appServiceClient.uploadTicketImages(uploadImagesRequest),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, DownloadPdfSuccess>>
      downloadPDFAllAccountSummary() async {
    return _repositoryHelpers.callApi<DownloadPdfSuccess>(
      () => _appServiceClient.downloadPDFAllAccountSummary(),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, DownloadExcelSuccess>>
      downloadExcelAllAccountSummary() async {
    return _repositoryHelpers.callApi<DownloadExcelSuccess>(
      () => _appServiceClient.downloadExcelAllAccountSummary(),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, DownloadPdfSuccess>> downloadPDFBookingAccountSummary(
    DownloadPdfBookingAccountSummaryRequest
        downloadPdfBookingAccountSummaryRequest,
  ) async {
    return _repositoryHelpers.callApi<DownloadPdfSuccess>(
      () => _appServiceClient.downloadPDFBookingAccountSummary(
          downloadPdfBookingAccountSummaryRequest.query),
      statusCode: 200,
    );
  }

  @override
  Future<Either<Failure, DownloadExcelSuccess>>
      downloadExcelBookingAccountSummary(
    DownloadExcelBookingAccountSummaryRequest
        downloadExcelBookingAccountSummaryRequest,
  ) async {
    return _repositoryHelpers.callApi<DownloadExcelSuccess>(
      () => _appServiceClient.downloadExcelBookingAccountSummary(
          downloadExcelBookingAccountSummaryRequest.query),
      statusCode: 200,
    );
  }
}
