sealed class Api {
  static const String baseUrlValyuta = "cbu.uz";
  static const String baseUrlFlag = "flagcdn.com";
  static const apiValyuta = "/oz/arkhiv-kursov-valyut/json/";
  static const apiFlag = "/16x12/ua.png";

  static const Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
  };
}