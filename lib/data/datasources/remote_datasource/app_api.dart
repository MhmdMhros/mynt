import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mynt/app/constants.dart';
import 'package:retrofit/retrofit.dart';
// ignore: unused_import
import '../../../core/models/responses.dart';
// ignore: unused_import
import '../../requests/requests.dart';
import 'package:http_parser/http_parser.dart';
part "app_api.g.dart";

@RestApi()
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(Constants.refreshTokenPath)
  Future<HttpResponse<RefreshTokenSuccessResponse>> refreshToken(
    @Body() RefreshTokenRequest refreshTokenRequest,
  );

  @POST(Constants.loginPath)
  Future<HttpResponse<LoginSuccessResponse>> login(
    @Body() LoginRequest loginRequest,
  );

  @POST(Constants.checkAccountPath)
  Future<HttpResponse<void>> checkAccount(
    @Body() CheckAccountRequest checkAccountRequest,
  );

  @POST(Constants.sendOtpPath)
  Future<HttpResponse<SendOtpResponse>> sendOtp(
    @Body() SendOtpRequest sendOtpRequest,
  );

  @GET(Constants.settingsPath)
  Future<HttpResponse<SettingsDataResponse>> settingsData();

  @POST(Constants.signupPath)
  Future<HttpResponse<SignupSuccessResponse>> signup(
    @Body() SignupRequest signupRequest,
  );

  @POST(Constants.otpVerificationPath)
  Future<HttpResponse<OtpVerificationSuccessResponse>> otpVerification(
    @Body() OtpVerificationRequest otpVerificationRequest,
  );

  @POST(Constants.resendAccountVerificationOtpPath)
  Future<HttpResponse<ResendEmailVerificationSuccessResponse>>
      resendEmailVerification(
    @Body() ResendEmailVerificationRequest resendEmailVerificationRequest,
  );

  @POST(Constants.forgetPasswordPath)
  Future<HttpResponse<ForgetPasswordSuccessResponse>> forgetPassword(
    @Body() ForgetPasswordRequest forgetPasswordRequest,
  );
  @POST(Constants.verifyResetPasswordOtpPath)
  Future<HttpResponse<VerifyResetPasswordOtpSuccessResponse>>
      verifyResetPasswordOtp(
    @Body() VerifyResetPasswordOtpRequest verifyResetPasswordOtpRequest,
  );
  @POST(Constants.resetPasswordPath)
  Future<HttpResponse<ResetPasswordSuccessResponse>> resetPassword(
    @Body() ResetPasswordRequest resetPasswordRequest,
  );
  @GET(Constants.getUserPath)
  Future<HttpResponse<UserResponse>> getUser(@Path() String token);

  @POST(Constants.logoutPath)
  Future<HttpResponse<void>> logout(
    @Path() String token,
    @Body() LogoutRequest logoutRequest,
  );

  @PATCH(Constants.updateUserPath)
  @MultiPart()
  Future<HttpResponse<UserResponse>> updateUser(
    @Path() String userId, [
    @Part() String? firstName,
    @Part() String? lastName,
    @Part() String? businessName,
    @Part() String? phoneNumber,
    @Part() String? about,
    @Part() String? trainingSince,
    @Part(name: 'services[]') List<String>? services,
    @Part() String? gender,
    @Part() String? email,
    @Part() String? city,
    @Part(contentType: 'image/png') File? photo,
    @Part(contentType: 'image/png') File? cover,
  ]);
  @PUT('')
  Future<HttpResponse<void>> uploadFile(
    @Body() UploadFileRequest uploadFileRequest,
  );
  @DELETE(Constants.deleteAccountPath)
  Future<HttpResponse<void>> deleteAccount(
    @Path() String accessToken,
  );
  @GET(Constants.getAllClientBodyPhotosPath)
  Future<HttpResponse<BodyPhotosDataResponse>> getAllClientBodyPhotos(
    @Path() String clientId,
    @Queries() Map<String, dynamic> query,
  );

  @POST(Constants.editAccountPath)
  Future<HttpResponse<void>> editAccountData(
    @Body() EditAccountDataRequest editAccountDataRequest,
  );

  @POST(Constants.editAccountPath)
  Future<HttpResponse<void>> editAccountEmail(
    @Body() EditEmailRequest editEmailRequest,
  );

  @POST(Constants.editAccountPath)
  Future<HttpResponse<void>> editAccountPhone(
    @Body() EditPhoneRequest editPhoneRequest,
  );
}
