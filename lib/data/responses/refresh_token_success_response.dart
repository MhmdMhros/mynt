part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class RefreshTokenSuccessResponse extends Equatable
    implements DataResponse<RefreshTokenSuccess> {
  final String? accessToken;
  final String? refreshToken;
  final int? expiresIn;

  const RefreshTokenSuccessResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  @override
  RefreshTokenSuccess toDomain() {
    return RefreshTokenSuccess(
      accessToken: accessToken.orEmpty(),
      refreshToken: refreshToken.orEmpty(),
      expiresIn: expiresIn ?? 0,
    );
  }

  @override
  List<Object?> get props => [accessToken, refreshToken, expiresIn];

  factory RefreshTokenSuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenSuccessResponseFromJson({...json, ...json, ...json});
}
