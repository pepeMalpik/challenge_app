import 'package:challenge_app/core/data/api_response.dart';
import 'package:challenge_app/features/login/domain/entities/credentials.dart';

abstract class LoginRepository {
  Future<ApiResponse<String>> attempLogin({required Credentials credentials});
}
