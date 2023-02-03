import 'package:flutter/material.dart';
import '../home.dart';
import 'infoCards.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; // to get the total size of screen
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(175.0), // here the desired height
        child: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white70,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          backgroundColor: Colors.red,
          title: Text("Welcome to Knowledge Land"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 1.05,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: [
              InfoCards().infoc2,
              InfoCards().infoc3,
              InfoCards().infoc4,
              InfoCards().infoc5,
              InfoCards().infoc6,
              InfoCards().infoc7,
              InfoCards().infoc8,
              InfoCards().infoc9,
              InfoCards().infoc10,
              InfoCards().infoc11,
              InfoCards().infoc12,
              InfoCards().infoc13
            ],
          ))
        ],
      ),
    );
  }
}
