import 'package:mynt/domain/entities/refresh_token_success.dart';
import 'package:mynt/domain/entities/send_otp.dart';

import '../../core/models/no_data.dart';
import '../entities/user.dart';
import '../entities/logout_success.dart';
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

  Future<Either<Failure, LogoutSuccess>> logout();

  Future<Either<Failure, User>> updateUser(
    UpdateUserRequest updateUserRequest,
  );

  Future<Either<Failure, NoData>> deleteAccount();
}
