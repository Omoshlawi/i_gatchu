class Settings {
  final String userToken;
  final String theme;
  final String pin;
  final bool isAuthenticated;
  final bool isPrivacyEnabled;
  final bool isBiometricEnabled;

  Settings({
    required this.userToken,
    required this.theme,
    required this.pin,
    required this.isPrivacyEnabled,
    required this.isBiometricEnabled,
    required this.isAuthenticated,
  });

  // Create a default instance with initial values
  factory Settings.defaultSettings() {
    return Settings(
      userToken: '',
      // Provide the initial user token
      theme: 'dark',
      // Provide the initial theme ('light' or 'dark', for example)
      pin: '2222',
      // Provide the initial PIN if required
      isPrivacyEnabled: false,
      // Provide the initial privacy setting
      isBiometricEnabled: false,
      isAuthenticated: false, // Provide the initial biometric setting
    );
  }

  // Create an instance with values copied from another Settings instance
  Settings copyWith({
    String? userToken,
    String? theme,
    String? pin,
    bool? isPrivacyEnabled,
    bool? isBiometricEnabled,
    bool? isAuthenticated,
  }) {
    return Settings(
      userToken: userToken ?? this.userToken,
      theme: theme ?? this.theme,
      pin: pin ?? this.pin,
      isPrivacyEnabled: isPrivacyEnabled ?? this.isPrivacyEnabled,
      isBiometricEnabled: isBiometricEnabled ?? this.isBiometricEnabled,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  bool checkPin(String? value) {
    return value == pin;
  }
}
