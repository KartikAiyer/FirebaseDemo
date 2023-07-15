/*
 * Copyright (c) 2023.  All rights reserved. You may not use,
 *  distribute or modify this code without the
 *  explicit permission of Drive Cloud
 */

import 'user.dart';

abstract class UserAuthService {
  Stream<DcUser?> get authStateChanged;
}