class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://212.129.13.21:988/api/";

  // receiveTimeout
  static const int receiveTimeout = 5000;

  // connectTimeout
  static const int connectionTimeout = 3000;

  // auth
  static const String userLoginUrl = "Account/login";
  static const String companyLoginUrl = "Account/company-login";
}
