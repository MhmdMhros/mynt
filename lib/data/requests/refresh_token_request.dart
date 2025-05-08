part of 'requests.dart';

@JsonSerializable(createFactory: false)
class RefreshTokenRequest {
  final String refreshToken;

  RefreshTokenRequest({required this.refreshToken});

  Map<String, dynamic> toJson() => _$RefreshTokenRequestToJson(this);
}
