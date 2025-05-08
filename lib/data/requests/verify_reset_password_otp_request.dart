part of 'requests.dart';

@JsonSerializable(createFactory: false)
class VerifyResetPasswordOtpRequest {
  final String otp;

  VerifyResetPasswordOtpRequest({
    required this.otp,
  });

  Map<String, dynamic> toJson() => _$VerifyResetPasswordOtpRequestToJson(this);
}
