class RefreshTokenSuccess {
  final String accessToken;
  final String refreshToken;
  final int expiresIn;

  RefreshTokenSuccess({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });
}
