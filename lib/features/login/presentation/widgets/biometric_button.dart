import 'package:challenge_app/core/res/app_colors.dart';
import 'package:challenge_app/core/routes/app_routes.dart';
import 'package:challenge_app/features/login/presentation/providers/biometric_provider.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class BiometricButton extends StatelessWidget {
  const BiometricButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BiometricProvider>(context);
    provider.addListener(() {
      if (provider.authOk) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.home,
          (route) => false,
        );
      }
    });
    if (!provider.showBiometrics) {
      return Container();
    }
    return CircleAvatar(
      radius: 30,
      backgroundColor: AppColors.primary,
      child: IconButton(
        iconSize: 30,
        color: Colors.white,
        onPressed: () {
          provider.authenticateWithBiometrics();
        },
        icon: _setupIcon(provider: provider),
      ),
    );
  }

  Icon _setupIcon({required BiometricProvider provider}) {
    var iconToReturn = Icon(Icons.fingerprint);
    if (provider.biometricTypes.contains(BiometricType.face)) {
      iconToReturn = Icon(Icons.face_unlock_outlined);
    }
    return iconToReturn;
  }
}

/*

if (provider.showBiometrics)
            


 */
