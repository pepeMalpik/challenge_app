import 'package:challenge_app/core/routes/route_generator.dart';
import 'package:challenge_app/core/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChallengeApp extends StatefulWidget {
  const ChallengeApp({Key? key}) : super(key: key);

  @override
  _ChallengeAppState createState() => _ChallengeAppState();
}

class _ChallengeAppState extends State<ChallengeApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    final Brightness? brightness =
        WidgetsBinding.instance?.window.platformBrightness;
    Provider.of<ThemeProvider>(context, listen: false)
        .onChangeApparience(brightness: brightness);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Challenge App',
      theme: themeProvider.theme,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
