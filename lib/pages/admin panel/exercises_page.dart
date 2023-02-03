import 'package:flutter/material.dart';
import 'package:gymico/pages/admin%20panel/display_exercises.dart';

class ShowExercises extends StatefulWidget {
  @override
  _ShowExercisesState createState() => _ShowExercisesState();
}

class _ShowExercisesState extends State<ShowExercises> {
  List<String> programNames = ["program1", "program2", "program3", "program4", "program5", "program6"];

  Future<Null> _showExercises(String programName) async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (_) {
          return DisplayExercises(programName: programName);
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: programNames.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(7),
          child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: Container(
              color: Colors.black54,
              child: ListTile(
                onTap: () {
                  _showExercises(programNames[index]);
                },
                title: Text(
                  programNames[index],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  size: 45,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
