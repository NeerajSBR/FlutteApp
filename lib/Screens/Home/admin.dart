import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_code/Screens/Home/components/calendar.dart';

import 'package:new_code/Screens/Teacher/signup_screen.dart';

import 'components/retrieve.dart';

class Admin extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  Admin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('WELCOME HOD'),
        actions: [
          FlatButton(
              onPressed: () {
                auth.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Text(
                'LOG OUT',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 95, 0, 95),
            child: Column(
              children: [
                TextButton.icon(
                  icon: Icon(
                    Icons.calendar_today_sharp,
                    size: 100,
                    color: Colors.white,
                  ),
                  label: Text(
                    'See Data',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Calendar()),
                    );
                  },
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: TextButton.icon(
                    icon: Icon(
                      Icons.add_circle,
                      size: 100,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Add',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: SizedBox(
                    height: 120,
                    width: 300,
                    child: TextButton.icon(
                      icon: Icon(
                        Icons.remove_circle,
                        size: 100,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Remove',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
