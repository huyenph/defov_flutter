part of provider_setup;

List<SingleChildWidget> independentProviders = [
  Provider.value(value: TokenExpiredHandler()),
  Provider.value(value: SharedPreferencesManager()),
];