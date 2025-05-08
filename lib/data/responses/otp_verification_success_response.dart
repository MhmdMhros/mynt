part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class OtpVerificationSuccessResponse extends Equatable
    implements DataResponse<OtpVerificationSuccess> {
  final String? message;

  const OtpVerificationSuccessResponse({
    required this.message,
  });

  @override
  OtpVerificationSuccess toDomain() {
    return OtpVerificationSuccess(message: message.orEmpty());
  }

  @override
  List<Object?> get props => [message];

  factory OtpVerificationSuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpVerificationSuccessResponseFromJson(json);
}
