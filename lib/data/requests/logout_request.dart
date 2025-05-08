part of 'requests.dart';

@JsonSerializable(createFactory: false)
class LogoutRequest {
  final String oldPassword;
  final String newPassword;
  final String newPasswordConfirm;

  LogoutRequest({
    required this.oldPassword,
    required this.newPassword,
    required this.newPasswordConfirm,
  });

  Map<String, dynamic> toJson() => _$LogoutRequestToJson(this);
}
