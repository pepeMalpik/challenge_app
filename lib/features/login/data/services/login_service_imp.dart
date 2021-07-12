import 'package:challenge_app/features/login/domain/entities/credentials.dart';
import 'package:challenge_app/core/data/api_response.dart';
import 'package:challenge_app/features/login/domain/services/login_service.dart';

class LoginServiceImp extends LoginService {
  @override
  Future<ApiResponse<String>> attempLogin(
      {required Credentials credentials}) async {
    final email = 'pepe@yopmail.com';
    final psw = 'holaPepe';
    await Future.delayed(const Duration(seconds: 2), () => "2");
    if (credentials.email == email && credentials.password == psw) {
      ApiResponse<String> response =
          ApiResponse<String>.completed('Credenciales correctas!');
      return response;
    } else {
      ApiResponse<String> response =
          ApiResponse<String>.error('Credenciales invalidas x.x');
      return response;
    }
  }
}
