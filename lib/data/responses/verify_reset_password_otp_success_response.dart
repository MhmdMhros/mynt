part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class VerifyResetPasswordOtpSuccessResponse extends Equatable
    implements DataResponse<VerifyResetPasswordOtpSuccess> {
  final String? message;
  final String? otp;

  const VerifyResetPasswordOtpSuccessResponse({
    required this.message,
    required this.otp,
  });

  @override
  VerifyResetPasswordOtpSuccess toDomain() {
    return VerifyResetPasswordOtpSuccess(
        message: message.orEmpty(), otp: otp.orEmpty());
  }

  @override
  List<Object?> get props => [message, otp];

  factory VerifyResetPasswordOtpSuccessResponse.fromJson(
      Map<String, dynamic> json) {
    json = {...json, ...json['payload']};
    return _$VerifyResetPasswordOtpSuccessResponseFromJson(json);
  }
}
