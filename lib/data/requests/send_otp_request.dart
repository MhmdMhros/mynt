part of 'requests.dart';

@JsonSerializable(createFactory: false)
class SendOtpRequest {
  final String identifier;

  SendOtpRequest({required this.identifier});

  Map<String, dynamic> toJson() => _$SendOtpRequestToJson(this);
}
