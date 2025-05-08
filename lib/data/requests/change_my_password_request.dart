part of 'requests.dart';

@JsonSerializable(createFactory: false)
class ChangeMyPasswordRequest {
  final String oldPassword;
  final String newPassword;
  final String newPasswordConfirm;

  ChangeMyPasswordRequest({
    required this.oldPassword,
    required this.newPassword,
    required this.newPasswordConfirm,
  });

  Map<String, dynamic> toJson() => _$ChangeMyPasswordRequestToJson(this);
}
