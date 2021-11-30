import 'package:flutter/material.dart';

class TeachData extends StatelessWidget {
  const TeachData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
          ),
          Text(
            'Your Data',
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
        ],
      ),
    );
  }
}
