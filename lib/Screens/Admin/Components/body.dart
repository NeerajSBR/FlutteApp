import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_code/Screens/Home/admin.dart';

import 'package:new_code/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:new_code/models/loading.dart';

import 'package:new_code/services/auther.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final AuthServicee _auth = AuthServicee();
  String password = '';
  String error = '';

  final auth = FirebaseAuth.instance;
  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (loading) {
      return Loading();
    } else {
      return Scaffold(
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 120),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'ADMIN',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 22),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 55)),
                    Image.asset('assets/images/sheela.png', scale: 1.8),
                  ],
                ),
                SizedBox(height: 50),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    validator: (val) =>
                        val.length < 6 ? 'Incorrect Password' : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: kPrimaryColor,
                      ),
                      hintText: 'Password',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
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
                          setState(() => loading = true);
                          dynamic result =
                              await _auth.papa('sam@gmail.com', password);

                          if (result == null) {
                            setState(() {
                              loading = false;
                              error = 'Invalid Password';
                            });
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Admin()));
                          }
                        }
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(fontSize: 23),
                      ),
                    ),
                  ),
                ),
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
}
