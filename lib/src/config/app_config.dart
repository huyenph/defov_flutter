enum Flavor { dev, stag, prod }

const String devURL = "https://api.stackexchange.com/2.2/";
const String stagURL = "https://api.stackexchange.com/2.2/";
const String prodURL = "https://api.stackexchange.com/2.2/";

class FlavorValues {
  final String baseUrl;

  const FlavorValues({required this.baseUrl});
}

class AppConfig {
  final Flavor flavor;

  static AppConfig? _instance;

  static AppConfig? get instance => _instance;

  AppConfig._internal(this.flavor);

  factory AppConfig({required Flavor flavor}) {
    _instance ??= AppConfig._internal(flavor);
    return _instance!;
  }

  String rootUrl() {
    switch (_instance!.flavor) {
      case Flavor.dev:
        return devURL;
      case Flavor.stag:
        return stagURL;
      default:
        return prodURL;
    }
  }
}
