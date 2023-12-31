/*
 * Copyright (c) 2023.  All rights reserved. You may not use,
 *  distribute or modify this code without the
 *  explicit permission of Drive Cloud
 */


import 'package:flutter/material.dart';

import 'user_profile_ui.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';

class FirebaseUserProfileUi extends UserProfileUi {
  @override
  Widget getWidget(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.person),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<ProfileScreen>(
              builder: (context) => ProfileScreen(
                appBar: AppBar(
                  title: const Text('User Profile'),
                ),
                actions: [
                  SignedOutAction((context) {
                    Navigator.of(context).pop();
                  }),
                ],
                children: [
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.network('data:image/png;base64,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'),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}