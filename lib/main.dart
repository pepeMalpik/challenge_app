import 'package:challenge_app/challenge_app.dart';
import 'package:challenge_app/core/dependency_injector.dart';
import 'package:challenge_app/core/providers/loading_provider.dart';
import 'package:challenge_app/features/quote/presentation/providers/quote_provider.dart';
import 'package:challenge_app/features/login/presentation/providers/biometric_provider.dart';
import 'package:challenge_app/features/login/presentation/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/providers/theme_provider.dart';

void main() {
  Dependencyinjector.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => getIt()),
        ChangeNotifierProvider<LoadingProvider>(create: (_) => getIt()),
        ChangeNotifierProvider<LoginProvider>(create: (_) => getIt()),
        ChangeNotifierProvider<BiometricProvider>(create: (_) => getIt()),
        ChangeNotifierProvider<Quoteprovider>(create: (_) => getIt()),
      ],
      child: ChallengeApp(),
    );
  }
}
