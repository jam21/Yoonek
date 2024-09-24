class Session {
  final String userName;
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final String refreshToken;
  final String authToken;
  final DateTime issued;
  final DateTime expires;

  const Session(
      {required this.userName,
      required this.accessToken,
      required this.tokenType,
      required this.expiresIn,
      required this.refreshToken,
      required this.authToken,
      required this.expires,
      required this.issued});
}
