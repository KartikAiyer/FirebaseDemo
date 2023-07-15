/*
 * Copyright (c) 2023.  All rights reserved. You may not use,
 *  distribute or modify this code without the
 *  explicit permission of Drive Cloud
 */


import 'package:firebase_auth/firebase_auth.dart';
import 'user.dart';

class FirebaseUser extends DcUser
{
  final User user;
  @override
  final UserType type;
  FirebaseUser(this.user, this.type);
  @override
  String? get name { return user.displayName; }
}