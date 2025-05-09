part of 'requests.dart';

@JsonSerializable(createFactory: false)
class LogoutRequest {
  final String deviceToken;
  final String deviceType;

  LogoutRequest({
    required this.deviceToken,
    required this.deviceType,
  });

  Map<String, dynamic> toJson() => _$LogoutRequestToJson(this);
}
