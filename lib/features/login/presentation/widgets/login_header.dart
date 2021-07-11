import 'package:challenge_app/core/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      child: Column(
        children: [
          SizedBox(height: 30),
          (_themeProvider.theme!.brightness == Brightness.dark)
              ? Image.asset(
                  'assets/img/logo_dark.png',
                  width: 50,
                )
              : Image.asset(
                  'assets/img/logo.png',
                  width: 50,
                ),
          SizedBox(height: 10),
          Text(
            'Bienvenido',
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
