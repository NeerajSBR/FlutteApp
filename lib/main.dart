import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_code/Screens/Welcome/components/body.dart';
import 'package:new_code/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome To Rnsit',
      theme: new ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      home: Blank(),
    );
  }
}
