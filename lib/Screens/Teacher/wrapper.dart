import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_code/Screens/Home/admin.dart';
import 'package:new_code/Screens/Home/home.dart';
import 'package:new_code/Screens/Teacher/signup_screen.dart';
import 'package:new_code/models/user.dart';

import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userr>(context);

    if (user == null) {
      return SignUpScreen();
    } else {
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get()
          .then((value) {
        print(value.data()['Role']);
      });
      if (user.uid == 'Kvl8igkebmg3g142eRYYuYbw0LS2') {
        return Admin();
      } else {
        return Home();
      }
    }
  }
}
