import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_code/Screens/Teacher/components/background.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:new_code/Screens/Teacher/components/press.dart';
import 'package:new_code/constants.dart';
import 'package:new_code/models/loading.dart';
import 'package:new_code/services/auth.dart';

class Body extends StatefulWidget {
  final Widget child;
  const Body({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  bool loading = false;

  String email = '';
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
      return Background(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 20)),
                Text(
                  "ISE PORTAL",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 0,
                ),
                SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 70)),
                    Image.asset('assets/images/sheela.png', scale: 1.9),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    validator: (val) => val.isEmpty ? 'Incorrect Email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    decoration: InputDecoration(
                      hintText: 'Your Email',
                      icon: Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
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
                SizedBox(height: 10),
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
                          dynamic result = await _auth.lalala(email, password);

                          if (result == null) {
                            setState(() {
                              loading = false;
                              error = 'Invalid Email OR Password';
                            });
                          }
                        }
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Pressed(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
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
