import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_code/Screens/Home/admin.dart';
import 'package:new_code/Screens/Home/home.dart';
import 'package:new_code/services/usercheck.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WELCOME TO MA HUZ'),
        centerTitle: true,
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Admin'),
              accountEmail: new Text('sam@gmail.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: NetworkImage('http://i.pravatar.cc/300'),
              ),
            ),
            new ListTile(
              title: Text('Home page'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => new Home(),
                  ),
                );
              },
            ),
            new ListTile(
              title: Text('Admin'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => new Admin(),
                  ),
                );
              },
            ),
            new ListTile(
              title: Text('Logout'),
              onTap: () {
                UserManagement().signOut();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Dashboard'),
      ),
    );
  }
}
