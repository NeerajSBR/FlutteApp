import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_code/Screens/Home/components/calendar.dart';
import 'package:new_code/Screens/Teacher/signup_screen.dart';

import 'package:new_code/Screens/data_screen/teacher_data.dart';

import 'package:new_code/constants.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final User user = auth.currentUser;
    final userid = user.uid;
    print('ur id = ' + userid);
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('HOME'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              auth.signOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: Text(
              'LOG OUT',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
          ),
          Text(
            'Are You Present?',
            style: TextStyle(color: Colors.white, fontSize: 23),
          ),
          Padding(padding: EdgeInsets.only(top: 50)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: kPrimaryColor),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Calendar()));
              },
              child: Text(
                'yes',
              )),
          Padding(padding: EdgeInsets.only(top: 50)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: kPrimaryColor),
            onPressed: () {},
            child: Text('No'),
          )
        ],
      ),
    );
  }
}
