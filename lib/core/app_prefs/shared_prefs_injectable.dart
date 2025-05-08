import 'package:injectable/injectable.dart';
import 'package:mynt/core/app_prefs/app_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class SharedPrefsInjectableModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  AppPreferences getAppPreferences(SharedPreferences prefs) =>
      AppPreferences(prefs);
}
