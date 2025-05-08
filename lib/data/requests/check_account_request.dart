part of 'requests.dart';

@JsonSerializable(createFactory: false)
class CheckAccountRequest {
  final String login;

  CheckAccountRequest({
    required this.login,
  });

  Map<String, dynamic> toJson() => _$CheckAccountRequestToJson(this);
}
