class UserTokenConfig {
  static String _token = ''; // Default to an empty string

  static setToken(String token) {
    _token = token;
  }

  static String get token {
    return _token;
  }
}
