import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserSecureStorage {
  static const _accessTokenKey = 'access_token';
  static const _userId = 'user_id';
  static const _usernameKey = 'username';
  static const _password = 'password';
  static const _emailKey = 'email';
  static const _refreshToken = 'refresh_token';
  static const _expiresIn = 'expires_in';
  static const _tokenSavedAt = 'token_saved_at';
  static const _deviceTokenKey = 'device_token_key';
  static const _deviceType = 'device_type';

  const UserSecureStorage(this._secureStorage);
  final FlutterSecureStorage _secureStorage;

  Future<void> upsertUserInfo({
    int? userId,
    String? email,
    String? password,
    String? accessToken,
    String? refreshToken,
    int? expiresIn,
    String? deviceToken,
    String? deviceType,
  }) async {
    await Future.wait([
      _secureStorage.write(key: _userId, value: userId.toString()),
      if (email != null) _secureStorage.write(key: _emailKey, value: email),
      if (password != null)
        _secureStorage.write(key: _password, value: password),
      if (accessToken != null)
        _secureStorage.write(key: _accessTokenKey, value: accessToken),
      if (refreshToken != null)
        _secureStorage.write(key: _refreshToken, value: refreshToken),
      if (expiresIn != null)
        _secureStorage.write(key: _expiresIn, value: expiresIn.toString()),
      if (deviceToken != null)
        _secureStorage.write(key: _deviceTokenKey, value: deviceToken),
      if (deviceType != null)
        _secureStorage.write(key: _deviceType, value: deviceType),
    ]);

    if (accessToken != null && expiresIn != null) {
      await _secureStorage.write(
        key: _tokenSavedAt,
        value: DateTime.now().toIso8601String(),
      );
    }
  }

  Future<void> upsertUserToken(String token, {int? expiresIn}) async {
    await _secureStorage.write(key: _accessTokenKey, value: token);
    if (expiresIn != null) {
      await _secureStorage.write(key: _expiresIn, value: expiresIn.toString());
      await _secureStorage.write(
        key: _tokenSavedAt,
        value: DateTime.now().toIso8601String(),
      );
    }
  }

  Future<void> updateAuthTokens({
    required String accessToken,
    required String refreshToken,
    required int expiresIn,
  }) async {
    await Future.wait([
      _secureStorage.write(key: _accessTokenKey, value: accessToken),
      _secureStorage.write(key: _refreshToken, value: refreshToken),
      _secureStorage.write(key: _expiresIn, value: expiresIn.toString()),
      _secureStorage.write(
        key: _tokenSavedAt,
        value: DateTime.now().toIso8601String(),
      ),
    ]);
  }

  Future<void> deleteUserInfo() => Future.wait([
        _secureStorage.delete(key: _userId),
        _secureStorage.delete(key: _accessTokenKey),
        _secureStorage.delete(key: _usernameKey),
        _secureStorage.delete(key: _emailKey),
        _secureStorage.delete(key: _refreshToken),
        _secureStorage.delete(key: _expiresIn),
        _secureStorage.delete(key: _tokenSavedAt),
        _secureStorage.delete(key: _deviceTokenKey),
        _secureStorage.delete(key: _deviceType),
      ]);

  Future<int?> getUserId() async {
    final value = await _secureStorage.read(key: _userId);
    return value != null ? int.tryParse(value) : null;
  }

  Future<String?> getUserAccessToken() =>
      _secureStorage.read(key: _accessTokenKey);

  Future<String?> getUserEmail() => _secureStorage.read(key: _emailKey);

  Future<String?> getUserPassword() => _secureStorage.read(key: _password);

  Future<String?> getUsername() => _secureStorage.read(key: _usernameKey);

  Future<String?> getRefreshToken() => _secureStorage.read(key: _refreshToken);

  Future<String?> getDeviceToken() => _secureStorage.read(key: _deviceTokenKey);

  Future<String?> getDeviceType() => _secureStorage.read(key: _deviceType);

  Future<int?> getExpiresIn() async {
    final value = await _secureStorage.read(key: _expiresIn);
    return value != null ? int.tryParse(value) : null;
  }

  Future<DateTime?> getTokenSavedAt() async {
    final value = await _secureStorage.read(key: _tokenSavedAt);
    return value != null ? DateTime.tryParse(value) : null;
  }

  Future<bool> isTokenExpired() async {
    final expiresIn = await getExpiresIn();
    final savedAt = await getTokenSavedAt();
    if (expiresIn == null || savedAt == null) return true;

    final expiryTime = savedAt.add(Duration(seconds: expiresIn));
    return DateTime.now().isAfter(expiryTime);
  }
}

@module
abstract class InjectableUserSecureStorageModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
}
