import 'package:flutter/material.dart';
import 'package:user_auth_attempt/auth/user_service.dart';
import 'auth/user.dart';
import 'service_locator.dart';
import 'home.dart';
import 'auth/user_auth_ui.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DcUser?>(
        stream: getIt<UserAuthService>().authStateChanged,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return getIt<UserAuthUi>().getWidget();
          }
          return HomeScreen();
        });
  }
}
