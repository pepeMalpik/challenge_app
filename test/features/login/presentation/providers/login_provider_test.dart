import 'package:challenge_app/core/providers/loading_provider.dart';
import 'package:challenge_app/features/login/domain/usecases/login_usecase.dart';
import 'package:challenge_app/features/login/presentation/providers/login_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLoadingProvider extends Mock implements LoadingProvider {}

class MockLoginUsecase extends Mock implements LoginUsecase {}

main() {
  group('login_provider_tests', () {
    test('show_password_init_false', () {
      final provider = LoginProvider(
        loadingProvider: MockLoadingProvider(),
        loginUsecase: MockLoginUsecase(),
      );
      expect(provider.showPassword, false);
    });
    test('toggle_password', () {
      final provider = LoginProvider(
        loadingProvider: MockLoadingProvider(),
        loginUsecase: MockLoginUsecase(),
      );
      provider.togglePassword();
      expect(provider.showPassword, true);
    });
  });
}
