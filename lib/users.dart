import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';

enum UserType
{
   renter, manager;
}

sealed class DcUsers {
   User? user;
   String? id;
   UserType type;
   DcUsers({required this.type});
   bool get isLoggedIn { return user != null; }
   DcUsers._typed(this.type);
   late final log = Logger(type.name);
}

class Manager extends DcUsers {
   Manager() : super._typed(UserType.manager);
}

class Renter extends DcUsers {
   Renter() : super._typed(UserType.renter);
}

