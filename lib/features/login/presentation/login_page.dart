import 'package:flutter/material.dart';
import 'package:challenge_app/core/widgets/custom_loading.dart';
import 'package:challenge_app/features/login/presentation/widgets/login_footer.dart';
import 'package:challenge_app/features/login/presentation/widgets/login_form.dart';
import 'package:challenge_app/features/login/presentation/widgets/login_header.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomLoading(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  height: screenHeigth * 0.9,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LoginHeader(),
                      LoginForm(),
                      LoginFooter(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
