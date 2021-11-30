import 'package:flutter/material.dart';
import 'package:new_code/Screens/Teacher/components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Body(),
    );
  }
}
