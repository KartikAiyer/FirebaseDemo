/*
 * Copyright (c) 2023.  All rights reserved. You may not use,
 *  distribute or modify this code without the
 *  explicit permission of Drive Cloud
 */

import 'package:firebase_auth/firebase_auth.dart';
import 'user_service.dart';
import 'firebase_user.dart';
import 'user.dart';

class FirebaseUserAuthService extends UserAuthService {
  @override
  Stream<DcUser?> get authStateChanged {
    return FirebaseAuth.instance.authStateChanges()
        .map((user) {
      if(user != null) {
        return FirebaseUser(user, UserType.manager);
      } else {
        return null;
      }
    });
  }
}