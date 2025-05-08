part of 'requests.dart';

@JsonSerializable(createFactory: false)
class OtpVerificationRequest {
  final String identifier;
  final String token;

  OtpVerificationRequest({required this.identifier, required this.token});

  Map<String, dynamic> toJson() => _$OtpVerificationRequestToJson(this);
}
