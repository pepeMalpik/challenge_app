import 'package:challenge_app/core/data/http_client.dart';
import 'package:challenge_app/core/providers/loading_provider.dart';
import 'package:challenge_app/core/providers/theme_provider.dart';
import 'package:challenge_app/features/login/presentation/providers/login_provider.dart';
import 'package:get_it/get_it.dart';

// This is our global ServiceLocator
GetIt getIt = GetIt.instance;

class Dependencyinjector {
  static void init() {
    getIt.registerLazySingleton(() => HttpClient());

    // coreProviders
    getIt.registerLazySingleton(() => LoadingProvider());
    getIt.registerLazySingleton(() => ThemeProvider());

    // providers
    getIt.registerLazySingleton(() => LoginProvider(loadingProvider: getIt()));

    // useCases

    // repositories

    //services
  }
}
