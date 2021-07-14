import 'package:challenge_app/core/utils/validate_email.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('validate_email', () {
    test('invalid_email', () {
      final email = 'pepe@yopmail';
      final isValid = ValidateEmail.isValid(email: email);
      expect(isValid, false);
    });
    test('valid_email', () {
      final email = 'pepe@yopmail.com';
      final isValid = ValidateEmail.isValid(email: email);
      expect(isValid, true);
    });
  });
}
