// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$SignupRequestToJson(SignupRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      'passwordConfirm': instance.passwordConfirm,
    };

Map<String, dynamic> _$VerifyEmailRequestToJson(VerifyEmailRequest instance) =>
    <String, dynamic>{
      'otp': instance.otp,
    };

Map<String, dynamic> _$ResendEmailVerificationRequestToJson(
        ResendEmailVerificationRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'username': instance.userName,
      'password': instance.password,
      'device_token': instance.deviceToken,
      'device_type': instance.deviceType,
    };

Map<String, dynamic> _$CheckAccountRequestToJson(
        CheckAccountRequest instance) =>
    <String, dynamic>{
      'login': instance.login,
    };

Map<String, dynamic> _$SendOtpRequestToJson(SendOtpRequest instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
    };

Map<String, dynamic> _$OtpVerificationRequestToJson(
        OtpVerificationRequest instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'token': instance.token,
    };

Map<String, dynamic> _$ResetPasswordRequestToJson(
        ResetPasswordRequest instance) =>
    <String, dynamic>{
      'login': instance.login,
      'password': instance.password,
      'confirm_password': instance.confirmPassword,
    };

Map<String, dynamic> _$ForgetPasswordRequestToJson(
        ForgetPasswordRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

Map<String, dynamic> _$VerifyResetPasswordOtpRequestToJson(
        VerifyResetPasswordOtpRequest instance) =>
    <String, dynamic>{
      'otp': instance.otp,
    };

Map<String, dynamic> _$UpdateUserRequestToJson(UpdateUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('businessName', instance.businessName);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('about', instance.about);
  writeNotNull('trainingSince', instance.trainingSince);
  writeNotNull('servicesOffered', instance.servicesOffered);
  writeNotNull('gender', instance.gender);
  writeNotNull('email', instance.email);
  writeNotNull('city', instance.city);
  val['coachId'] = instance.id;
  return val;
}

Map<String, dynamic> _$ChangeMyPasswordRequestToJson(
        ChangeMyPasswordRequest instance) =>
    <String, dynamic>{
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
      'newPasswordConfirm': instance.newPasswordConfirm,
    };

Map<String, dynamic> _$LogoutRequestToJson(LogoutRequest instance) =>
    <String, dynamic>{
      'device_token': instance.deviceToken,
      'device_type': instance.deviceType,
    };

Map<String, dynamic> _$RefreshTokenRequestToJson(
        RefreshTokenRequest instance) =>
    <String, dynamic>{
      'refresh_token': instance.refreshToken,
    };

Map<String, dynamic> _$EditAccountDataRequestToJson(
        EditAccountDataRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'birthdate': instance.birthDate,
    };

Map<String, dynamic> _$EditEmailRequestToJson(EditEmailRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

Map<String, dynamic> _$EditPhoneRequestToJson(EditPhoneRequest instance) =>
    <String, dynamic>{
      'phone': instance.phoneNumber,
    };

Map<String, dynamic> _$CreateRestrictionRequestToJson(
        CreateRestrictionRequest instance) =>
    <String, dynamic>{
      'property_id': instance.propertyId,
      'date_from': instance.dateFrom,
      'date_to': instance.dateTo,
    };

Map<String, dynamic> _$CreateReviewRequestToJson(
        CreateReviewRequest instance) =>
    <String, dynamic>{
      'ticket_id': instance.ticketId,
      'comment': instance.comment,
      'score': instance.score,
    };

Map<String, dynamic> _$CreateTicketRequestToJson(
        CreateTicketRequest instance) =>
    <String, dynamic>{
      'property_id': instance.propertyId,
      'title_id': instance.titleId,
      'description': instance.description,
      'attachment[gallery][]': instance.attachments,
    };

Map<String, dynamic> _$UploadImagesRequestToJson(
        UploadImagesRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'attachment[]': instance.files,
    };
