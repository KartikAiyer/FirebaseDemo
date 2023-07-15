/*
 * Copyright (c) 2023.  All rights reserved. You may not use,
 *  distribute or modify this code without the
 *  explicit permission of Drive Cloud
 */


import 'package:flutter/material.dart';

import 'user_auth_ui.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';

class FirebaseUserAuthUi extends UserAuthUi {
  @override
  Widget getWidget() {
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
}
