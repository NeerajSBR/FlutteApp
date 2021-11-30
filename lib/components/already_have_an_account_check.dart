import 'package:flutter/material.dart';
import 'package:new_code/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyHaveAnAccountCheck({
    key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? '' : "",
          style: TextStyle(
            color: kPrimaryLightColor,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? " " : '',
            style: TextStyle(
                color: kPrimaryLightColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
