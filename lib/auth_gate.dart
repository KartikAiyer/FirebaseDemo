import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';

import 'home.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(
              providers: [
                EmailAuthProvider(),
                GoogleProvider(
                    clientId:
                        '860666419301-vs5k9v9950e8eupqfetk58fqosaagj4b.apps.googleusercontent.com')
              ],
              headerBuilder: (context, constraints, shrinkOffset) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Image.network(
                        "https://static.vecteezy.com/system/resources/thumbnails/005/948/256/small/electric-vehicle-power-charging-icon-isolated-on-white-background-electrical-car-symbol-ev-icon-with-charging-cable-sedan-automotive-body-style-variant-free-vector.jpg"),
                  ),
                );
              },
              subtitleBuilder: (context, action) {
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: switch (action) {
                      AuthAction.signIn =>
                        const Text('Welcome to Drive Cloud, please Sign in!'),
                      _ => const Text('Welcome to Drive Cloud, please Sign Up')
                    });
              },
              footerBuilder: (context, action) {
                return const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                      'By signing in, you agree to our terms and conditions',
                      style: TextStyle(color: Colors.grey),
                    ));
              },
              sideBuilder: (context, shrinkOffset) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                        "https://static.vecteezy.com/system/resources/thumbnails/005/948/256/small/electric-vehicle-power-charging-icon-isolated-on-white-background-electrical-car-symbol-ev-icon-with-charging-cable-sedan-automotive-body-style-variant-free-vector.jpg"),
                  ),
                );
              },
            );
          }
          return HomeScreen();
        });
  }
}
