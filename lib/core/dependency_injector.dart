import 'package:challenge_app/core/data/http_client.dart';
import 'package:challenge_app/core/providers/loading_provider.dart';
import 'package:challenge_app/core/providers/theme_provider.dart';
import 'package:challenge_app/features/quote/data/repositories/quote_repository_impl.dart';
import 'package:challenge_app/features/quote/data/services/quote_service_impl.dart';
import 'package:challenge_app/features/quote/domain/repositories/quote_repository.dart';
import 'package:challenge_app/features/quote/domain/services/quote_service.dart';
import 'package:challenge_app/features/quote/domain/usecases/quote_usecase.dart';
import 'package:challenge_app/features/quote/presentation/providers/quote_provider.dart';
import 'package:challenge_app/features/login/data/repositories/login_repository_imp.dart';
import 'package:challenge_app/features/login/data/services/login_service_imp.dart';
import 'package:challenge_app/features/login/domain/repositories/login_repository.dart';
import 'package:challenge_app/features/login/domain/services/login_service.dart';
import 'package:challenge_app/features/login/domain/usecases/login_usecase.dart';
import 'package:challenge_app/features/login/presentation/providers/biometric_provider.dart';
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
    getIt.registerLazySingleton(() => BiometricProvider());
    getIt.registerLazySingleton(
      () => LoginProvider(
        loadingProvider: getIt(),
        loginUsecase: getIt(),
      ),
    );
    getIt.registerLazySingleton(
      () => Quoteprovider(
        quoteUsecase: getIt(),
        loadingProvider: getIt(),
      ),
    );

    // useCases
    getIt.registerLazySingleton(() => LoginUsecase(repository: getIt()));
    getIt.registerLazySingleton(() => QuoteUsecase(quoteRepository: getIt()));

    // repositories
    getIt.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(loginService: getIt()),
    );

    getIt.registerLazySingleton<QuoteRepository>(
      () => QuoteRepositoryImp(quoteService: getIt()),
    );

    //services
    getIt.registerLazySingleton<LoginService>(() => LoginServiceImp());
    getIt.registerLazySingleton<QuoteService>(
      () => QuoteServiceImpl(httpClient: getIt()),
    );
  }
}
