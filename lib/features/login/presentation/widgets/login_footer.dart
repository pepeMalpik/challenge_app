import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'no tienes cuenta?',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'registrate',
          ),
        ),
      ],
    );
  }
}
