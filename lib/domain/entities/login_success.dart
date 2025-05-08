class LoginSuccess {
  final int userId;
  final String accessToken;
  final String refreshToken;
  final int expiresIn;

  LoginSuccess({
    required this.accessToken,
    required this.userId,
    required this.refreshToken,
    required this.expiresIn,
  });
}
