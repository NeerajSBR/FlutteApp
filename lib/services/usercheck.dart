import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:new_code/Screens/Home/home.dart';
import 'package:new_code/Screens/Teacher/signup_screen.dart';
import 'package:new_code/models/dashboard.dart';

class UserManagement {
  Widget handleAuth() {
    return new StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return DashboardPage();
        }
        return SignUpScreen();
      },
    );
  }

  authorizeAccess(BuildContext context) {
    FirebaseAuth.instance.currentUser.uid;
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
