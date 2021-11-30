import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_code/models/user.dart';

class AuthServicee {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Using _adminguser(User user) {
    return user != null ? Using(uid: user.uid) : null;
  }

  Stream<Using> get user {
    return _auth.authStateChanges().map(_adminguser);
  }

  Future papa(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _adminguser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
