import 'package:flutter/material.dart';

class LoadingProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _msg = '';
  String get msg => _msg;

  showLoading({
    required String msg,
  }) {
    this._msg = msg;
    this._isLoading = true;
    notifyListeners();
  }

  hideLoading() {
    this._isLoading = false;
    notifyListeners();
  }
}
