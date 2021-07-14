import 'package:challenge_app/core/data/api_response.dart';
import 'package:challenge_app/features/login/data/services/login_service_imp.dart';
import 'package:challenge_app/features/login/domain/entities/credentials.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('login_service', () {
    test('attemp_login_success', () async {
      final credentials = Credentials(
        email: 'pepe@yopmail.com',
        password: 'holaPepe',
        remember: true,
      );
      final service = LoginServiceImp();
      final ok = await service.attempLogin(credentials: credentials);
      expect(ok.status, Status.COMPLETED);
    });
    test('attemp_login_failure', () async {
      final credentials = Credentials(
        email: 'pepe@gmail.com',
        password: '123546',
        remember: true,
      );
      final service = LoginServiceImp();
      final ok = await service.attempLogin(credentials: credentials);
      expect(ok.status, Status.ERROR);
    });
  });
}
