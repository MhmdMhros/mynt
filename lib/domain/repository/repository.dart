import 'package:mynt/domain/entities/account_summary_data.dart';
import 'package:mynt/domain/entities/booking.dart';
import 'package:mynt/domain/entities/bookings_data.dart';
import 'package:mynt/domain/entities/create_ticket_success.dart';
import 'package:mynt/domain/entities/dashboard_data.dart';
import 'package:mynt/domain/entities/images_data.dart';
import 'package:mynt/domain/entities/notifications_data.dart';
import 'package:mynt/domain/entities/refresh_token_success.dart';
import 'package:mynt/domain/entities/request_service_data.dart';
import 'package:mynt/domain/entities/restriction_success.dart';
import 'package:mynt/domain/entities/review_success.dart';
import 'package:mynt/domain/entities/send_otp.dart';
import 'package:mynt/domain/entities/settings_data.dart';
import 'package:mynt/domain/entities/tickets_data.dart';
import 'package:mynt/domain/entities/un_read_notifications_count.dart';

import '../../core/models/no_data.dart';
import '../entities/user.dart';
import '../entities/reset_password_success.dart';
import '../entities/verify_reset_password_otp_success.dart';
import '../entities/forget_password_success.dart';
import '../entities/login_success.dart';
import '../entities/resend_email_verification_success.dart';
import '../entities/otp_verification_success.dart';
import '../entities/signup_success.dart';
// ignore: unused_import
import 'package:dartz/dartz.dart';
// ignore: unused_import
import '../../core/network/failure.dart';
// ignore: unused_import
import '../../data/requests/requests.dart';

abstract class Repository {
  Future<Either<Failure, RefreshTokenSuccess>> refreshToken(
    RefreshTokenRequest refreshTokenRequest,
  );

  Future<Either<Failure, LoginSuccess>> login(
    LoginRequest loginRequest,
  );

  Future<Either<Failure, NoData>> checkAccount(
    CheckAccountRequest checkAccountRequest,
  );

  Future<Either<Failure, SendOtp>> sendOtp(
    SendOtpRequest sendOtpRequest,
  );

  Future<Either<Failure, NoData>> uploadFile(
    UploadFileRequest uploadFileRequest,
  );

  Future<Either<Failure, NoData>> editAccountData(
    EditAccountDataRequest editAccountDataRequest,
  );

  Future<Either<Failure, NoData>> editAccountEmail(
    EditEmailRequest editEmailRequest,
  );

  Future<Either<Failure, NoData>> editAccountPhone(
    EditPhoneRequest editPhoneRequest,
  );

  Future<Either<Failure, SettingsData>> settingsData();

  Future<Either<Failure, DashboardData>> dashboardData();

  Future<Either<Failure, NotificationsData>> notificationsData(
      GetAllNotificationsRequest getAllNotificationsRequest);

  Future<Either<Failure, UnReadNotificationsCount>>
      getUnReadNotificationsCount();

  Future<Either<Failure, BookingsData>> bookingsData(
      GetAllUnitsRequest getAllUnitsRequest);

  Future<Either<Failure, TicketsData>> ticketsData(
      GetAllTicketsRequest getAllTicketsRequest);

  Future<Either<Failure, AccountSummaryData>> allAccountSummaryData();

  Future<Either<Failure, AccountSummaryData>> bookingAccountSummaryData(
      GetBookingAccountSummaryRequest getBookingAccountSummaryRequest);

  Future<Either<Failure, Booking>> getBookingDetails(String bookingId);

  Future<Either<Failure, RestrictionSuccess>> createRestriction(
      CreateRestrictionRequest createRestrictionRequest);

  Future<Either<Failure, ReviewSuccess>> createReview(
      CreateReviewRequest createReviewRequest);

  Future<Either<Failure, CreateTicketSuccess>> createTicket(
      CreateTicketRequest createTicketRequest);

  Future<Either<Failure, NoData>> readNotification(
    String notificationId,
  );

  Future<Either<Failure, SignupSuccess>> signup(
    SignupRequest signupRequest,
  );
  Future<Either<Failure, OtpVerificationSuccess>> otpVerification(
    OtpVerificationRequest otpVerificationRequest,
  );
  Future<Either<Failure, ResendEmailVerificationSuccess>>
      resendEmailVerification(
    ResendEmailVerificationRequest resendEmailVerificationRequest,
  );
  Future<Either<Failure, ForgetPasswordSuccess>> forgetPassword(
    ForgetPasswordRequest forgetPasswordRequest,
  );
  Future<Either<Failure, VerifyResetPasswordOtpSuccess>> verifyResetPasswordOtp(
    VerifyResetPasswordOtpRequest verifyResetPasswordOtpRequest,
  );
  Future<Either<Failure, ResetPasswordSuccess>> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  );

  Future<Either<Failure, User>> getUser();

  Future<Either<Failure, NoData>> logout(
    LogoutRequest logoutRequest,
  );

  Future<Either<Failure, User>> updateUser(
    UpdateUserRequest updateUserRequest,
  );

  Future<Either<Failure, NoData>> deleteAccount();

  Future<Either<Failure, RequestServiceData>> requestServiceData();

  Future<Either<Failure, ImagesData>> uploadTicketImages(
    UploadImagesRequest uploadImagesRequest,
  );
}
