part of 'requests.dart';

@JsonSerializable(createFactory: false)
class LoginRequest {
  final String userName;
  final String password;
  final String deviceToken;
  final String deviceType;

  LoginRequest({
    required this.userName,
    required this.password,
    required this.deviceToken,
    required this.deviceType,
  });

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
