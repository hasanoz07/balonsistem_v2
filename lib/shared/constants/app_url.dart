final class AppUrl {
  const AppUrl._();

  static const AppUrl instance = AppUrl._();

  // Config
  String get baseUrl => "https://www.balonsistem.com/api/";
  int get receiveTimeout => 15000;
  int get connectionTimeout => 15000;

  // Endpoints
  String get login => "/auth/login";
}
