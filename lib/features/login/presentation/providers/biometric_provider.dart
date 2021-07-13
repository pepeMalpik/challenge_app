import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometricProvider with ChangeNotifier {
  late LocalAuthentication localAuthentication;
  bool _showBiometrics = false;
  bool get showBiometrics => _showBiometrics;

  bool _authOk = false;
  bool get authOk => _authOk;

  List<BiometricType> _biometricTypes = [];
  List<BiometricType> get biometricTypes => _biometricTypes;

  BiometricProvider() {
    this.localAuthentication = LocalAuthentication();
    canUseBiometrics();
  }

  canUseBiometrics() async {
    this._showBiometrics = await this.localAuthentication.canCheckBiometrics;
    this._biometricTypes =
        await this.localAuthentication.getAvailableBiometrics();
    notifyListeners();
  }

  authenticateWithBiometrics() async {
    try {
      var isAuthenticated = await localAuthentication.authenticate(
        localizedReason: 'Ingresa con tus biometricos',
      );
      if (isAuthenticated) {
        this._authOk = true;
        notifyListeners();
        this._authOk = false;
      } else {
        this._authOk = false;
      }
    } catch (e) {
      print(e);
      this._authOk = false;
      localAuthentication.stopAuthentication();
    }
  }
}
