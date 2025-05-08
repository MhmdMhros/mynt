part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class SendOtpResponse extends Equatable implements DataResponse<SendOtp> {
  final int? token;

  const SendOtpResponse({
    required this.token,
  });

  @override
  SendOtp toDomain() {
    return SendOtp(
      token: token ?? 000000,
    );
  }

  @override
  List<Object?> get props => [token];

  factory SendOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$SendOtpResponseFromJson({...json});
}
