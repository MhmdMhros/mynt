import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String kPrefsKeyIsOnBoardingScreenViewed =
    "PREFS_KEY_IS_ONBOARDING_SCREEN_VIEWED";
const String kPrefsKeyIsUserLogin = "PREFS_KEY_IS_User_Login";
const String kPrefsForgotPasswordData = "forgot_password_data";

@injectable
class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  Future<bool> saveIsOnBoardingScreenViewed() async {
    return await _sharedPreferences.setBool(
        kPrefsKeyIsOnBoardingScreenViewed, true);
  }

  Future<bool> resetIsOnBoardingScreenViewed() async {
    return await _sharedPreferences.setBool(
        kPrefsKeyIsOnBoardingScreenViewed, false);
  }

  bool getIsOnBoardingScreenViewed() {
    bool? isOnBoardingScreenViewed =
        _sharedPreferences.getBool(kPrefsKeyIsOnBoardingScreenViewed);
    if (isOnBoardingScreenViewed != null) {
      return isOnBoardingScreenViewed;
    } else {
      return false;
    }
  }

  Future<bool> saveIsUserLogin() async {
    return await _sharedPreferences.setBool(kPrefsKeyIsUserLogin, true);
  }

  Future<bool> resetIsUserLogin() async {
    return await _sharedPreferences.setBool(kPrefsKeyIsUserLogin, false);
  }

  bool getIsUserLogin() {
    bool? isUserLogin = _sharedPreferences.getBool(kPrefsKeyIsUserLogin);
    if (isUserLogin != null) {
      return isUserLogin;
    } else {
      return false;
    }
  }

  Future<bool> removeData({
    required String key,
  }) async {
    return await _sharedPreferences.remove(key);
  }

  bool containsKey({required String key}) {
    return _sharedPreferences.containsKey(key);
  }
}
