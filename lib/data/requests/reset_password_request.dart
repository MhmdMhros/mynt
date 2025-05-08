part of 'requests.dart';

@JsonSerializable(createFactory: false)
class ResetPasswordRequest {
  final String login;
  final String password;
  final String confirmPassword;

  ResetPasswordRequest({
    required this.login,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);
}
