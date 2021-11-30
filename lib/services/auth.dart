import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_code/models/user.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create obj

  Userr _userFromFirebaseUser(User user) {
    return user != null ? Userr(uid: user.uid) : null;
  }

  //auth stream
  Stream<Userr> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //token claimer

  Future<Map<String, dynamic>> get claims async {
    final user = _auth.currentUser;
    final token = await user.getIdTokenResult(true);
    return (token.claims);
  }

  //anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //reg
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in
  Future lalala(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //another

  //sign out

}
