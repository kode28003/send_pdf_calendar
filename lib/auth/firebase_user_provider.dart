import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ContactCalendarFirebaseUser {
  ContactCalendarFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ContactCalendarFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ContactCalendarFirebaseUser> contactCalendarFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ContactCalendarFirebaseUser>(
      (user) {
        currentUser = ContactCalendarFirebaseUser(user);
        return currentUser!;
      },
    );
