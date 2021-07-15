import 'package:challenge_app/core/data/api_response.dart';
import 'package:challenge_app/features/login/domain/entities/credentials.dart';
import 'package:challenge_app/features/login/domain/repositories/login_repository.dart';

class LoginUsecase {
  final LoginRepository repository;

  LoginUsecase({required this.repository});

  Future<ApiResponse<String>> exceute({required Credentials credentials}) {
    return repository.attempLogin(credentials: credentials);
  }
}
