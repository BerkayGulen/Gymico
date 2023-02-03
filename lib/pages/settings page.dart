import 'package:flutter/material.dart';
import 'package:gymico/models/user_model.dart';
import 'package:gymico/services/database.dart';
import '../alert dialog.dart';
import 'home.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  DatabaseService _databaseService = new DatabaseService();
  String _newDisplayName;

  Future<Null> _showAvatars() async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (_) {
          return AlertDialogPage();
        });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Users>(
        stream: DatabaseService().userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Users userData = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 1.0,
                leading: IconButton(
                    color: Colors.black54,
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
                    }),
                title: Text(
                  "SETTINGS",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                centerTitle: true,
              ),
              body: Container(
                padding: EdgeInsets.only(left: 20, top: 25, right: 20),
                child: ListView(
                  children: [
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(userData.avatar),
                            radius: 60,
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black54,
                                    border: Border.all(
                                      width: 4,
                                      color: Colors.white,
                                    )),
                                height: 40,
                                width: 40,
                                child: IconButton(
                                  iconSize: 20,
                                  icon: Icon(Icons.edit),
                                  color: Colors.white,
                                  onPressed: () {
                                    _showAvatars();
                                  },
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      onChanged: (val) {
                        setState(() {
                          this._newDisplayName = val;
                        });
                      },
                      decoration: InputDecoration(
                          icon: Icon(Icons.edit),
                          contentPadding: EdgeInsets.only(bottom: 3),
                          labelText: "Display Name",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: userData.displayName,
                          hintStyle:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      enabled: false,
                      decoration: InputDecoration(
                          icon: Icon(Icons.email_outlined),
                          contentPadding: EdgeInsets.only(bottom: 3),
                          labelText: "Email",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: userData.email,
                          hintStyle:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      enabled: false,
                      decoration: InputDecoration(
                          icon: Icon(Icons.fitness_center_outlined),
                          contentPadding: EdgeInsets.only(bottom: 3),
                          labelText: "Program Number",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: userData.programNumber.toString(),
                          hintStyle:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      enabled: false,
                      decoration: InputDecoration(
                          icon: Icon(Icons.fastfood_outlined),
                          contentPadding: EdgeInsets.only(bottom: 3),
                          labelText: "BMI",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: userData.bmi.toString(),
                          hintStyle:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                    ),
                    SizedBox(height: 20),
                    Center(
                        child: MaterialButton(
                      color: Colors.black54.withOpacity(0.4),
                      onPressed: () async {
                        print(this._newDisplayName);
                        if (this._newDisplayName != null)
                          await _databaseService.updateDisplayName(this._newDisplayName);
                      },
                      child: Text(
                        "update",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ))
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
