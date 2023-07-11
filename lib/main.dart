import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';
import 'firebase_options.dart';
import 'app.dart';

void main() async {
  if(kDebugMode) {
    Logger.root.level = Level.ALL;
  } else {
    Logger.root.level = Level.SEVERE;
  }
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  if(kDebugMode) {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }
  runApp(const MyApp());
}

