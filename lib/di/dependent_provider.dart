part of provider_setup;

List<SingleChildWidget> dependentProviders = [
  ProxyProvider<TokenExpiredHandler, HttpHandler>(
    update: (_, tokenExpiredHandler, __) => HttpHandler(tokenExpiredHandler),
  ),

  /**
   * Api Service
   */
  ProxyProvider2<HttpHandler, SharedPreferencesManager, AuthApiService>(
    update: (_, httpHandler, prefs, __) =>
        RestApiFactory(httpHandler, prefs).provideAuthApi(),
  ),

  /**
   * Repositories
   */
  ProxyProvider2<AuthApiService, SharedPreferencesManager, AuthRepositoryImpl>(
    update: (_, authApiService, prefs, __) =>
        AuthRepositoryImpl(authApiService, prefs),
  ),

  /**
   * UseCases
   */
  ProxyProvider<AuthRepositoryImpl, AuthUseCase>(
    update: (_, authRepository, __) => AuthUseCase(authRepository),
  ),
];
