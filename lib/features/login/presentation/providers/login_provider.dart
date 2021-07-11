import 'package:challenge_app/core/providers/loading_provider.dart';
import 'package:challenge_app/core/res/strings.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final LoadingProvider loadingProvider;

  bool _showPassword = false;
  bool get showPassword => _showPassword;

  String? _emailErrorMsg;
  String? get emailErrorMsg => _emailErrorMsg;

  LoginProvider({required this.loadingProvider});

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
  }) {
    print('email: $email');
    print('password: $password');
    if (!validateEmail(email: email)) {
      return;
    }
  }

  bool validateEmail({required String email}) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
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
