import 'package:defov_flutter/src/data/datasources/local/shared_preferences_manager.dart';
import 'package:defov_flutter/src/data/datasources/remote/auth/auth_api_service.dart';
import 'package:defov_flutter/src/data/datasources/remote/http_handler.dart';
import 'package:defov_flutter/src/data/datasources/remote/rest_api_factory.dart';
import 'package:defov_flutter/src/data/datasources/remote/token_expired_handler.dart';
import 'package:defov_flutter/src/data/repositories/auth/auth_repository_impl.dart';
import 'package:defov_flutter/src/domains/repositories/auth_repository.dart';
import 'package:defov_flutter/src/domains/usecases/auth_usecase.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  /**
   * Independent
   */
  injector.registerSingleton<TokenExpiredHandler>(TokenExpiredHandler());
  injector.registerSingleton<SharedPreferencesManager>(
    SharedPreferencesManager(),
  );

  /**
   * Api Services
   */
  injector.registerSingleton<HttpHandler>(HttpHandler(injector()));
  injector.registerSingleton<RestApiFactoryListener>(HttpHandler(injector()));
  injector.registerSingleton<AuthApiService>(
    RestApiFactory(injector(), injector()).provideAuthApi(),
  );

  /**
   * Repositories
   */
  injector.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(injector(), injector()),
  );

  /**
   * UseCases
   */
  injector.registerSingleton<AuthUseCase>(AuthUseCase(injector()));
}
