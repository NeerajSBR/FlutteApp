import 'package:flutter/material.dart';
import 'package:new_code/Screens/Teacher/signup_screen.dart';

import '../../constants.dart';

class Approve extends StatelessWidget {
  const Approve({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 290)),
          Text(
            'Please Wait For HOD Approval',
            style: TextStyle(fontSize: 40, color: Colors.amber),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: size.width * 0.65,
            height: size.height * 0.11,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                ),
                onPressed: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
                child: Text(
                  'Click Here',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
