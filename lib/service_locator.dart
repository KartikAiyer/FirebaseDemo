/*
 * Copyright (c) 2023.  All rights reserved. You may not use,
 *  distribute or modify this code without the
 *  explicit permission of Drive Cloud
 */

import 'auth/firebase_user_profile_ui.dart';
import 'auth/user_auth_ui.dart';
import 'auth/user_service.dart';
import 'auth/user_profile_ui.dart';

import 'auth/firebase_user_auth_service.dart';
import 'auth/firebase_user_auth_ui.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<UserAuthService>(() => FirebaseUserAuthService());
  getIt.registerLazySingleton<UserAuthUi>(() => FirebaseUserAuthUi());
  getIt.registerLazySingleton<UserProfileUi>(() => FirebaseUserProfileUi());
}