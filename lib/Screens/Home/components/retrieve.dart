import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_code/Screens/Home/admin.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Admin(),
                  ),
                );
              },
              icon: Icon(Icons.arrow_back))
        ],
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text("ADD USER"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null) return CircularProgressIndicator();

          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot users = snapshot.data.docs[index];
              if (users['Role'] == 'users') {
                return ListTile(
                  title: Text(users['name']),
                  subtitle: Text(users['email']),
                );
              } else {
                return SizedBox(
                  height: 0,
                );
              }
            },
          );
        },
      ),
    );
  }
}
