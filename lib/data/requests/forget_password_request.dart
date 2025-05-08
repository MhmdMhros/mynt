part of 'requests.dart';

@JsonSerializable(createFactory: false)
class ForgetPasswordRequest {
  final String email;

  ForgetPasswordRequest({
    required this.email,
  });

  Map<String, dynamic> toJson() => _$ForgetPasswordRequestToJson(this);
}
