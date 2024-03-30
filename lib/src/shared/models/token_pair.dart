class TokenPair {
  final String accessToken;
  final String refreshToken;

  const TokenPair({required this.accessToken, required this.refreshToken});

  @override
  String toString() {
    return "TokenPair<accessToken:$accessToken, refreshToken: $refreshToken >";
  }
}
