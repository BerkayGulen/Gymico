import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymico/models/exercise_model.dart';
import 'package:gymico/services/database.dart';
import 'package:provider/provider.dart';

import 'listing_exercises.dart';

class DisplayExercises extends StatelessWidget {
  final String programName;
  DisplayExercises({this.programName});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 300,
        width: 500,
        child: StreamProvider<List<Exercises>>.value(
          value: DatabaseService(programName: this.programName).exercises,
          child: ListingExercises(),
        ),
      ),
      actions: <Widget>[
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black54,
          child: Text("Close"),
        )
      ],
    );
  }
}

// class DisplayExercises extends StatefulWidget {
//     String programName;
//     DisplayExercises({this.programName});
//
//    @override
//   _DisplayExercisesState createState() => _DisplayExercisesState();
// }
//
// class _DisplayExercisesState extends State<DisplayExercises> {
//
//   CollectionReference program = FirebaseFirestore.instance.collection(this.widget.programName);
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
