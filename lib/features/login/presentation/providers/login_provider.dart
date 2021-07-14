import 'package:challenge_app/core/data/api_response.dart';
import 'package:challenge_app/core/providers/loading_provider.dart';
import 'package:challenge_app/core/utils/validate_email.dart';
import 'package:challenge_app/features/login/domain/entities/credentials.dart';
import 'package:challenge_app/features/login/domain/usecases/login_usecase.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final LoadingProvider loadingProvider;
  final LoginUsecase loginUsecase;

  ApiResponse<String>? _response;
  ApiResponse<String>? get response => _response;

  bool _showPassword = false;
  bool get showPassword => _showPassword;

  String? _emailErrorMsg;
  String? get emailErrorMsg => _emailErrorMsg;

  LoginProvider({
    required this.loadingProvider,
    required this.loginUsecase,
  });

  doTask({required BuildContext context}) async {
    this.loadingProvider.showLoading(msg: 'leyendo datos');
    await Future.delayed(const Duration(seconds: 3), () => "3");
    this.loadingProvider.hideLoading();
  }

  togglePassword() {
    if (!this._showPassword) {
      this._showPassword = true;
    } else {
      this._showPassword = false;
    }
    notifyListeners();
  }

  attempLogin({
    required String email,
    required String password,
  }) async {
    print('email: $email');
    print('password: $password');
    if (!validateEmail(email: email)) {
      return;
    }
    this.loadingProvider.showLoading(msg: 'leyendo datos');
    try {
      final credentials = Credentials(
        email: email,
        password: password,
        remember: false,
      );
      this._response = await this.loginUsecase.exceute(
            credentials: credentials,
          );
      notifyListeners();
      this._response = null;
      this.loadingProvider.hideLoading();
    } catch (e) {
      this.loadingProvider.hideLoading();
    }
  }

  bool validateEmail({required String email}) {
    bool emailValid = ValidateEmail.isValid(email: email);
    if (email.length <= 0) {
      _emailErrorMsg = 'El email es obligatorio';
      notifyListeners();
      return false;
    }
    if (!emailValid) {
      _emailErrorMsg = 'Proporciona un email válido';
      notifyListeners();
      return false;
    }
    _emailErrorMsg = null;
    notifyListeners();
    return true;
  }
}
