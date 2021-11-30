import 'package:flutter/material.dart';
import 'package:new_code/Screens/Admin/Components/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
