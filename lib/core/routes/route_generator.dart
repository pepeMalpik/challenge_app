import 'package:challenge_app/core/routes/app_routes.dart';
import 'package:challenge_app/features/quote/presentation/quote_page.dart';
import 'package:challenge_app/features/login/presentation/login_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => QuotePage());
      default:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}
