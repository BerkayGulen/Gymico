import 'package:flutter/material.dart';
import 'package:gymico/models/user_model.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  text(String text, Color color, int fontSize) {
    return Text(
      text,
      style: TextStyle(color: color, fontWeight: FontWeight.bold),
    );
  }

  Future<Null> _showUserInfo(String displayName, String email, int programNumber, double bmi, String uid,
      double goalWeight, bool isAdmin) async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.greenAccent[400],
                child: Text("close"),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
              )
            ],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
            title: Text(
              "User Info",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Container(
              decoration: new BoxDecoration(
                //color: const Color(0xFFFFFF),
                color: Colors.white,
              ),
              width: 500,
              height: 250,
              child: Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        text("Admin:   ", Colors.greenAccent[400], 25),
                        text(isAdmin.toString(), Colors.black54, 15),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        text("Display Name:   ", Colors.greenAccent[400], 25),
                        text(displayName, Colors.black54, 15),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        text("Email:   ", Colors.greenAccent[400], 25),
                        text(email, Colors.black54, 15),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        text("Program Number:   ", Colors.greenAccent[400], 25),
                        text(programNumber.toString(), Colors.black54, 15),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        text("BMI:   ", Colors.greenAccent[400], 25),
                        text(bmi.toString(), Colors.black54, 15),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        text("Goal Weight:   ", Colors.greenAccent[400], 25),
                        text(goalWeight.toString(), Colors.black54, 15),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        text("UID:   ", Colors.greenAccent[400], 25),
                        Expanded(
                            child: Text(
                          uid,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black54),
                        )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<Users>>(context);

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: 7.0),
          child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: Container(
              color: Colors.black54,
              child: ListTile(
                onTap: () {
                  _showUserInfo(
                    users[index].displayName,
                    users[index].email,
                    users[index].programNumber,
                    users[index].bmi,
                    users[index].uid,
                    users[index].goalWeight,
                    users[index].admin,
                  );
                },
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  size: 45,
                  color: Colors.black,
                ),
                //isThreeLine: true,
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.blueGrey,
                  backgroundImage: AssetImage(users[index].avatar),
                ),
                title: Text(
                  users[index].displayName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                // subtitle: Text(
                //   "email: " +
                //       users[index].email +
                //       "\nprogram number: " +
                //       users[index].programNumber.toString() +
                //       "\nbmi: " +
                //       users[index].bmi.toString() +
                //       "\nuid: " +
                //       users[index].uid,
                // ),
              ),
            ),
          ),
        );
      },
    );
  }
}
