part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class LoginSuccessResponse extends Equatable
    implements DataResponse<LoginSuccess> {
  @JsonKey(name: 'id')
  final int? userId;
  final String? accessToken;
  final String? refreshToken;
  final int? expiresIn;

  const LoginSuccessResponse({
    required this.userId,
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  @override
  LoginSuccess toDomain() {
    return LoginSuccess(
      userId: userId ?? 0,
      accessToken: accessToken.orEmpty(),
      refreshToken: refreshToken.orEmpty(),
      expiresIn: expiresIn ?? 0,
    );
  }

  @override
  List<Object?> get props => [userId, accessToken, refreshToken, expiresIn];

  factory LoginSuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginSuccessResponseFromJson(
          {...json['user'], ...json, ...json, ...json});
}
