import 'package:flutter/material.dart';
import 'package:gymico/models/exercise_model.dart';
import 'package:provider/provider.dart';

class ListingExercises extends StatefulWidget {
  @override
  _ListingExercisesState createState() => _ListingExercisesState();
}

class _ListingExercisesState extends State<ListingExercises> {
  @override
  Widget build(BuildContext context) {
    final exercise = Provider.of<List<Exercises>>(context);

    return ListView.builder(
      itemCount: exercise.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: 7.0),
          child: Card(
            // margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              leading: Expanded(
                child: Container(
                  width: 150,
                  child: Expanded(
                    child: Text(exercise[index].name),
                  ),
                ),
              ),
              trailing: Container(
                padding: EdgeInsets.all(3),
                child: Image(
                  image: AssetImage(exercise[index].gif),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
