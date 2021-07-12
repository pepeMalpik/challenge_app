import 'package:challenge_app/core/data/http_client.dart';
import 'package:challenge_app/core/providers/loading_provider.dart';
import 'package:challenge_app/core/providers/theme_provider.dart';
import 'package:challenge_app/features/login/data/repositories/login_repository_imp.dart';
import 'package:challenge_app/features/login/data/services/login_service_imp.dart';
import 'package:challenge_app/features/login/domain/repositories/login_repository.dart';
import 'package:challenge_app/features/login/domain/services/login_service.dart';
import 'package:challenge_app/features/login/domain/usecases/login_usecase.dart';
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
    getIt.registerLazySingleton(
      () => LoginProvider(
        loadingProvider: getIt(),
        loginUsecase: getIt(),
      ),
    );

    // useCases
    getIt.registerLazySingleton(() => LoginUsecase(repository: getIt()));

    // repositories
    getIt.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(loginService: getIt()),
    );

    //services
    getIt.registerLazySingleton<LoginService>(() => LoginServiceImp());
  }
}
