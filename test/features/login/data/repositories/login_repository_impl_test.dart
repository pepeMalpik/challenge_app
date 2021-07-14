import 'package:challenge_app/core/data/api_response.dart';
import 'package:challenge_app/features/login/data/repositories/login_repository_imp.dart';
import 'package:challenge_app/features/login/data/services/login_service_imp.dart';
import 'package:challenge_app/features/login/domain/entities/credentials.dart';
import 'package:challenge_app/features/login/domain/services/login_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_repository_impl_test.mocks.dart';

@GenerateMocks([LoginServiceImp])
main() {
  test('repository_attemp_login_success', () async {
    final mockLoginService = MockLoginServiceImp();
    final credentials = Credentials(
      email: 'pepe@yopmail.com',
      password: "holaPepe",
      remember: false,
    );
    final expectedResponse = Future.value(ApiResponse.completed('Bienvenido'));
    when(mockLoginService.attempLogin(credentials: credentials))
        .thenAnswer((_) async => expectedResponse);
    final repository = LoginRepositoryImpl(loginService: mockLoginService);
    expect(await repository.attempLogin(credentials: credentials),
        await expectedResponse);
    // final res = await repository.attempLogin(credentials: credentials);

    // expect(res.status, Status.COMPLETED);
  });
}
