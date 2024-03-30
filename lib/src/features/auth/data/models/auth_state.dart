
class AuthState {
  final bool isAuthenticated;
  final bool isAccountVerified;
  final bool isProfileComplete;

  AuthState({
    required this.isAccountVerified,
    required this.isProfileComplete,
    required this.isAuthenticated,
  });

  factory AuthState.defaultState() {
    return AuthState(
      isAccountVerified: false  ,
      isProfileComplete: false,
      isAuthenticated: false
    );
  }

  factory AuthState.fromResponse({
    bool isAccountVerified = false,
    bool isProfileComplete = false,
    bool isAuthenticated = false
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated,
      isAccountVerified: isAccountVerified,
      isProfileComplete: isProfileComplete,
    );
  }

  AuthState copyWith({

    bool? isAccountVerified,
    bool? isAuthenticated,
    bool? isProfileComplete,
  }) =>
      AuthState(
        isAuthenticated: isAuthenticated ?? this.isAuthenticated,
        isAccountVerified: isAccountVerified ?? this.isAccountVerified,
        isProfileComplete: isProfileComplete ?? this.isProfileComplete,
      );

  @override
  String toString() {
    return "AuthState<isAuthenticated: $isAuthenticated, isAccountVerified: $isAccountVerified, isProfileComplete: $isProfileComplete>";
  }
}


class AuthResponse{
  final String accessToken;
  final String refreshToken;
  final bool accountVerified;
  final bool profileUpdated;

  AuthResponse({required this.accountVerified, required this.profileUpdated, required this.accessToken, required this.refreshToken});
  @override
  String toString() {
    return "AuthState<accessToken: $accessToken, refreshToken: $refreshToken, accountVerified: $accountVerified, profileUpdated: $profileUpdated>";
  }
}