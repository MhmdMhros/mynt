part of 'requests.dart';

@JsonSerializable(createFactory: false)
class SignupRequest {
  final String email;
  final String password;
  final String role;
  final String passwordConfirm;

  SignupRequest({
    required this.email,
    this.role = 'COACH',
    required this.password,
    required this.passwordConfirm,
  });

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}
