import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_code/Screens/Admin/login_screen.dart';
import 'package:new_code/Screens/Home/admin.dart';
import 'package:new_code/models/user.dart';
import 'package:provider/provider.dart';

class Wraper extends StatefulWidget {
  const Wraper({Key key}) : super(key: key);

  @override
  _WraperState createState() => _WraperState();
}

class _WraperState extends State<Wraper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Using>(context);
    if (user == null) {
      return LoginScreen();
    } else {
      return Admin();
    }
  }
}
