import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_gatchu/src/features/user_preference/data/models/Setings.dart';

class SettingsController extends StateNotifier<Settings> {
  SettingsController() : super(Settings.defaultSettings());

  void updateSettings({
    String? userToken,
    String? theme,
    String? pin,
    bool? isPrivacyEnabled,
    bool? isBiometricEnabled,
    bool? isAuthenticated,
  }) {
    state = state.copyWith(
        userToken: userToken,
        theme: theme,
        pin: pin,
        isPrivacyEnabled: isPrivacyEnabled,
        isBiometricEnabled: isBiometricEnabled,
        isAuthenticated: isAuthenticated);
  }

  Settings getState() {
    return state;
  }

  void patchSettings({
    String? userToken,
    String? theme,
    String? pin,
    bool? isPrivacyEnabled,
    bool? isBiometricEnabled,
    bool? isAuthenticated,
  }) {
    state = state.copyWith(
        userToken: userToken ?? state.userToken,
        theme: theme ?? state.theme,
        pin: pin ?? state.pin,
        isPrivacyEnabled: isPrivacyEnabled ?? state.isPrivacyEnabled,
        isBiometricEnabled: isBiometricEnabled ?? state.isBiometricEnabled,
        isAuthenticated: isAuthenticated ?? state.isAuthenticated);
  }

  void clearSettings() {
    state = Settings.defaultSettings();
  }
}
