import 'package:flutter/material.dart';
import 'package:gymico/models/user_model.dart';
import 'package:gymico/pages/admin%20panel/exercises_page.dart';
import 'package:gymico/pages/admin%20panel/user_list.dart';
import 'package:gymico/pages/home.dart';
import 'package:gymico/services/auth.dart';
import 'package:gymico/services/database.dart';
import 'package:provider/provider.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  AuthService _auth = new AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Users>>.value(
      value: DatabaseService().users,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            elevation: 0.0,
            // backgroundColor: Colors.grey[800],
            centerTitle: true,
            backgroundColor: Colors.blueGrey[800],
            title: Text(
              "ADMIN PANEL",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
            ),
            bottom: TabBar(
              indicatorWeight: 3,
              indicatorColor: Colors.deepOrange[900],
              tabs: [
                Text(
                  "Users",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                ),
                Text(
                  "Exercices",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          body: Container(
            child: TabBarView(
              children: [
                UserList(),
                ShowExercises(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
