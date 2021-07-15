import 'package:challenge_app/core/data/api_response.dart';
import 'package:challenge_app/core/res/app_colors.dart';
import 'package:challenge_app/core/res/strings.dart';
import 'package:challenge_app/core/routes/app_routes.dart';
import 'package:challenge_app/features/login/presentation/providers/login_provider.dart';
import 'package:challenge_app/features/login/presentation/widgets/biometric_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _email, _password;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<LoginProvider>(context, listen: false);
      provider.addListener(() {
        if (provider.response?.status == Status.COMPLETED) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.home,
            (route) => false,
          );
        }
        if (provider.response?.status == Status.ERROR) {
          SnackBar snackError = SnackBar(
            content: Text(provider.response?.message ?? ''),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackError);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: TextField(
                controller: _email,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                cursorColor: AppColors.primary,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: Strings.login_input_email,
                  labelText: Strings.login_input_email,
                  errorText: provider.emailErrorMsg,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: TextField(
                controller: _password,
                autocorrect: false,
                keyboardType: TextInputType.visiblePassword,
                obscureText: !provider.showPassword,
                cursorColor: AppColors.primary,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: Strings.login_input_password,
                  labelText: Strings.login_input_password,
                  suffixIcon: IconButton(
                    onPressed: () {
                      provider.togglePassword();
                    },
                    icon: (provider.showPassword)
                        ? Icon(Icons.remove_red_eye)
                        : Icon(Icons.visibility_off),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          MaterialButton(
            minWidth: double.infinity,
            height: 58,
            onPressed: () {
              provider.attempLogin(
                email: _email.text,
                password: _password.text,
              );
            },
            child: Text(
              Strings.login_btn_login,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            color: AppColors.primary,
          ),
          SizedBox(height: 20),
          BiometricButton(),
        ],
      ),
    );
  }
}
