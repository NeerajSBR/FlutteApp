import 'package:flutter/material.dart';
import 'package:new_code/Screens/Admin/login_screen.dart';
import 'package:new_code/Screens/Admin/wraper.dart';
import 'package:new_code/Screens/Home/admin.dart';
import 'package:new_code/Screens/Teacher/wrapper.dart';
import 'package:new_code/Screens/Welcome/components/backgroud.dart';
import 'package:new_code/components/rounded_button.dart';
import 'package:new_code/models/user.dart';
import 'package:new_code/services/auth.dart';

import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 0)),
            Image.asset(
              "assets/images/rulogo.png",
              scale: 1,
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            Text(
              'WELCOME TO ISE',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            Text(
              'DEPARTMENT',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
            Padding(padding: EdgeInsets.only(top: 60)),
            RoundedButton(
              text: 'ADMIN',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            RoundedButton(
              text: 'TEACHERS',
              color: Color(0xFFB39DDB),
              textcolor: Colors.grey.shade900,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Blank();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Blank extends StatelessWidget {
  const Blank({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Userr>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
