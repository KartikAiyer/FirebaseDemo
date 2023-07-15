import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';

enum UserType
{
   renter, manager;
}

abstract class DcUser{
   UserType get type;
   String? get name;
}
