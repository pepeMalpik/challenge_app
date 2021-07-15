import 'package:challenge_app/features/login/domain/entities/credentials.dart';
import 'package:challenge_app/core/data/api_response.dart';
import 'package:challenge_app/features/login/domain/repositories/login_repository.dart';
import 'package:challenge_app/features/login/domain/services/login_service.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginService loginService;

  LoginRepositoryImpl({required this.loginService});

  @override
  Future<ApiResponse<String>> attempLogin({required Credentials credentials}) {
    return loginService.attempLogin(credentials: credentials);
  }
}
