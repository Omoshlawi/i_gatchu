import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  final SharedPreferences _prefs;

  SettingsRepository(this._prefs);

  // User Token
  String get userToken => _prefs.getString('user_token') ?? '';
  set userToken(String value) => _prefs.setString('user_token', value);

  // Theme
  String get theme => _prefs.getString('theme') ?? 'light';
  set theme(String value) => _prefs.setString('theme', value);

  // PIN
  String get pin => _prefs.getString('pin') ?? '';
  set pin(String value) => _prefs.setString('pin', value);

  // Privacy Settings
  bool get isPrivacyEnabled => _prefs.getBool('is_privacy_enabled') ?? false;
  set isPrivacyEnabled(bool value) => _prefs.setBool('is_privacy_enabled', value);

  // Biometric Settings
  bool get isBiometricEnabled => _prefs.getBool('is_biometric_enabled') ?? false;
  set isBiometricEnabled(bool value) => _prefs.setBool('is_biometric_enabled', value);

  // Other settings can be added similarly

  // Clear all user preferences
  Future<void> clear() async {
    await _prefs.clear();
  }
}
