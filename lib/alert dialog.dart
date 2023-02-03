import 'package:flutter/material.dart';
import 'package:gymico/services/database.dart';

class AlertDialogPage extends StatefulWidget {
  @override
  _AlertDialogPageState createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {
  DatabaseService _databaseService = new DatabaseService();

  List<String> avatars = [
    "assets/avatars/avatar1.jpg",
    "assets/avatars/avatar2.jpg",
    "assets/avatars/avatar3.png",
    "assets/avatars/avatar4.png"
  ];
  String _selectedItem;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 500,
        height: 300,
        child: ListView.builder(
            itemCount: avatars.length,
            itemBuilder: (context, index) {
              return Container(
                child: Row(
                  children: [
                    Radio(
                        value: avatars[index],
                        groupValue: _selectedItem,
                        onChanged: (val) {
                          setState(() {
                            this._selectedItem = val;
                            print(_selectedItem);
                          });
                        }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(avatars[index]),
                        radius: 45,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
      title: Text("Avatars"),
      actions: <Widget>[
        MaterialButton(
          onPressed: () async {
            await _databaseService.updateAvatar(_selectedItem);
            Navigator.pop(context);
          },
          color: Colors.black54,
          child: Text("Save"),
        )
      ],
    );
  }
}
