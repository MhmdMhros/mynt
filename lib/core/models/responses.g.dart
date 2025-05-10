// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoDataResponse _$NoDataResponseFromJson(Map<String, dynamic> json) =>
    NoDataResponse();

SignupSuccessResponse _$SignupSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    SignupSuccessResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

OtpVerificationSuccessResponse _$OtpVerificationSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    OtpVerificationSuccessResponse(
      message: json['message'] as String?,
    );

ResendEmailVerificationSuccessResponse
    _$ResendEmailVerificationSuccessResponseFromJson(
            Map<String, dynamic> json) =>
        ResendEmailVerificationSuccessResponse(
          success: json['success'] as bool?,
          message: json['message'] as String?,
        );

LoginSuccessResponse _$LoginSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    LoginSuccessResponse(
      userId: json['id'] as int?,
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      expiresIn: json['expires_in'] as int?,
    );

SendOtpResponse _$SendOtpResponseFromJson(Map<String, dynamic> json) =>
    SendOtpResponse(
      token: json['token'] as int?,
    );

ForgetPasswordSuccessResponse _$ForgetPasswordSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordSuccessResponse(
      message: json['message'] as String?,
    );

VerifyResetPasswordOtpSuccessResponse
    _$VerifyResetPasswordOtpSuccessResponseFromJson(
            Map<String, dynamic> json) =>
        VerifyResetPasswordOtpSuccessResponse(
          message: json['message'] as String?,
          otp: json['otp'] as String?,
        );

ResetPasswordSuccessResponse _$ResetPasswordSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordSuccessResponse(
      message: json['message'] as String?,
    );

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as int?,
      birthDate: json['birthdate'] as String?,
      locale: json['locale'] as String?,
      commissionValue: json['commission_value'] as String?,
      commissionType: json['commission_type'] as int?,
      statusId: json['status_id'] as int?,
      statusText: json['status_text'] as String?,
      statusSlug: json['status_slug'] as String?,
      balance: json['balance'] as int?,
      provider: json['provider'] == null
          ? null
          : UserResponse.fromJson(json['provider'] as Map<String, dynamic>),
    );

ChangePasswordSuccessResponse _$ChangePasswordSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordSuccessResponse(
      message: json['message'] as String?,
    );

SignedUrlResponse _$SignedUrlResponseFromJson(Map<String, dynamic> json) =>
    SignedUrlResponse(
      video: json['video'] == null
          ? null
          : SignedUrlDataResponse.fromJson(
              json['video'] as Map<String, dynamic>),
      thumbnail: json['thumbnail'] == null
          ? null
          : SignedUrlDataResponse.fromJson(
              json['thumbnail'] as Map<String, dynamic>),
    );

SignedUrlDataResponse _$SignedUrlDataResponseFromJson(
        Map<String, dynamic> json) =>
    SignedUrlDataResponse(
      id: json['id'] as String?,
      signature: json['signature'] as String?,
    );

BodyPhotosDataResponse _$BodyPhotosDataResponseFromJson(
        Map<String, dynamic> json) =>
    BodyPhotosDataResponse(
      bodyPhotos: (json['bodyPhotos'] as List<dynamic>?)
          ?.map((e) => BodyPhotoResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
    );

BodyPhotoResponse _$BodyPhotoResponseFromJson(Map<String, dynamic> json) =>
    BodyPhotoResponse(
      id: json['id'] as String?,
      photoUrl: json['photoUrl'] as String?,
      type: json['type'] as String?,
      createdAt: json['createdAt'] as String?,
    );

RefreshTokenSuccessResponse _$RefreshTokenSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenSuccessResponse(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      expiresIn: json['expires_in'] as int?,
    );

SettingsDataResponse _$SettingsDataResponseFromJson(
  Map<String, dynamic> json,
) =>
    SettingsDataResponse(
      aboutUsContent: json['about_us_content'] as String?,
      termsContent: json['terms_content'] as String?,
      privacyContent: json['privacy_content'] as String?,
      copyrightContent: json['copyright_content'] as String?,
      deleteAccountContent: json['delete_account_content'] as String?,
      plansSubscriptionsTermsContent:
          json['plans_subscriptions_terms_content'] as String?,
      paymentTermsContent: json['payment_terms_content'] as String?,
      aboutUsContentText: json['about_us_content_text'] as String?,
      termsContentText: json['terms_content_text'] as String?,
      privacyContentText: json['privacy_content_text'] as String?,
      copyrightContentText: json['copyright_content_text'] as String?,
      deleteAccountContentText: json['delete_account_content_text'] as String?,
      plansSubscriptionsTermsContentText:
          json['plans_subscriptions_terms_content_text'] as String?,
      paymentTermsContentText: json['payment_terms_content_text'] as String?,
    );
