import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_code/Screens/data_screen/approve.dart';
import 'package:new_code/services/auth.dart';
import 'package:new_code/services/database.dart';
import '../../../constants.dart';

class Pressed extends StatefulWidget {
  const Pressed({Key key}) : super(key: key);

  @override
  _PressedState createState() => _PressedState();
}

class _PressedState extends State<Pressed> {
  final AuthService _auth = AuthService();
  String name = '';
  String staffId = '';
  String email = '';
  String password = '';
  String error = '';
  String uid = '';
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 90),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 140)),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1E6FF),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter Name' : null,
                    onChanged: (val) {
                      setState(() => name = val);
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                      hintText: 'Name',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1E6FF),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    validator: (val) =>
                        val.isEmpty ? 'Enter Valid Staff ID' : null,
                    onChanged: (val) {
                      setState(() => staffId = val);
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.format_list_numbered,
                        color: kPrimaryColor,
                      ),
                      hintText: 'Staff ID',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1E6FF),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter Email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.alternate_email,
                        color: kPrimaryColor,
                      ),
                      hintText: 'Your Email',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Align(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1E6FF),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    validator: (val) =>
                        val.length < 6 ? 'Enter Characters More than 6' : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      suffix: Icon(
                        Icons.visibility,
                        color: kPrimaryColor,
                      ),
                      icon: Icon(
                        Icons.lock,
                        color: kPrimaryColor,
                      ),
                      hintText: 'Password',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0),
              Align(
                child: Container(
                  width: size.width * 0.65,
                  height: size.height * 0.11,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 40),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryColor),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);
                          final User user = await auth.currentUser;
                          final userid = user.uid;
                          if (result == null) {
                            setState(() => error = 'Please Enter Valid Inputs');
                          } else {
                            await DatabaseService(uid: user.uid).updateData(
                                name, staffId, email, 'users');

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Approve()));
                          }
                        }
                      },
                      child: Text(
                        'Create Acc',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
