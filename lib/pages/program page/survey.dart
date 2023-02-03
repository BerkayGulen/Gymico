import 'package:flutter/material.dart';
import 'package:gymico/services/database.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../home.dart';

class ProgramCreater extends StatefulWidget {
  @override
  _ProgramCreaterState createState() => _ProgramCreaterState();
}

class _ProgramCreaterState extends State<ProgramCreater> {
  DatabaseService _dataBaseService = new DatabaseService();
  bool _hasBeenPressed1 = false;
  bool _hasBeenPressed2 = false;
  bool _hasBeenPressed3 = false;
  bool _hasBeenPressed4 = false;
  bool _hasBeenPressed5 = false;
  @override
  int counter;
  bool female = true;
  bool male = true;
  int programNumber;

  void _finder() {
    if (counter == 1 && male == true) {
      programNumber = 1;
    } else if (counter == 2 && male == true) {
      programNumber = 2;
    } else if (counter == 3 && male == true) {
      programNumber = 3;
    } else if (counter == 1 && male == false) {
      programNumber = 4;
    } else if (counter == 2 && male == false) {
      programNumber = 5;
    } else if (counter == 3 && male == false) {
      programNumber = 6;
    }
    _dataBaseService.updateProgramNumber(programNumber);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));

    print('programNumber is  ' + programNumber.toString());
    print('Counter is  ' + counter.toString());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        child: ListView(
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.red[500],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: -23,
                    blurRadius: 17,
                    offset: Offset(0, 17), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Text(
                '  Let\'s Find Your Program ',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  wordSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(35.0),
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: -23,
                    blurRadius: 17,
                    offset: Offset(0, 17), // changes position of shadow
                  ),
                ],
                color: Colors.blueGrey[300],
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Column(
                children: [
                  Text(
                    'Male or Female ?',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: _hasBeenPressed1 ? Colors.blueGrey[800] : Colors.blueGrey[600],
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              spreadRadius: -23,
                              blurRadius: 17,
                              offset: Offset(0, 17), // changes position of shadow
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: Icon(MdiIcons.genderFemale),
                          iconSize: 90,
                          color: Colors.white,
                          tooltip: 'Female',
                          onPressed: () {
                            setState(() {
                              female = true;
                              male = false;
                              _hasBeenPressed1 = !_hasBeenPressed1;
                              _hasBeenPressed2 = false;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: _hasBeenPressed2 ? Colors.blueGrey[800] : Colors.blueGrey[600],
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              spreadRadius: -23,
                              blurRadius: 17,
                              offset: Offset(0, 17), // changes position of shadow
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: Icon(MdiIcons.genderMale),
                          iconSize: 90,
                          color: Colors.white,
                          tooltip: 'Male',
                          onPressed: () {
                            setState(() {
                              _hasBeenPressed2 = !_hasBeenPressed2;
                              _hasBeenPressed1 = false;
                              female = false;
                              male = true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35),
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.blueGrey[300],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: -23,
                    blurRadius: 17,
                    offset: Offset(0, 17), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Column(
                children: [
                  Text(
                    'Choose your goal',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: -17,
                          blurRadius: 17,
                          offset: Offset(0, 17), // changes position of shadow
                        ),
                      ],
                    ),
                    width: 250.0,
                    height: 45.0,
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
                      color: _hasBeenPressed3 ? Colors.blueGrey[800] : Colors.blueGrey[600],
                      textColor: Colors.black,
                      onPressed: () {
                        setState(() {
                          counter = 1;
                          _hasBeenPressed3 = !_hasBeenPressed3;
                          _hasBeenPressed4 = false;
                          _hasBeenPressed5 = false;
                        });
                      },
                      child: Text(
                        'Gain Muscle',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 250.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[850],
                          spreadRadius: -17,
                          blurRadius: 17,
                          offset: Offset(0, 17), // changes position of shadow
                        ),
                      ],
                    ),
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
                      color: _hasBeenPressed4 ? Colors.blueGrey[800] : Colors.blueGrey[600],
                      textColor: Colors.black,
                      onPressed: () {
                        setState(() {
                          _hasBeenPressed4 = !_hasBeenPressed4;
                          _hasBeenPressed3 = false;
                          _hasBeenPressed5 = false;
                          counter = 2;
                        });
                      },
                      child: Text(
                        'Fat Burning Workout',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 45,
                    width: 250,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: -17,
                          blurRadius: 17,
                          offset: Offset(0, 17), // changes position of shadow
                        ),
                      ],
                    ),
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
                      color: _hasBeenPressed5 ? Colors.blueGrey[800] : Colors.blueGrey[600],
                      textColor: Colors.black,
                      onPressed: () {
                        setState(() {
                          _hasBeenPressed5 = !_hasBeenPressed5;
                          _hasBeenPressed3 = false;
                          _hasBeenPressed4 = false;
                          counter = 2;
                          counter = 3;
                        });
                      },
                      child: Text(
                        'Be Ready for Summer',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 130),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[850],
                    spreadRadius: -17,
                    blurRadius: 17,
                    offset: Offset(0, 17), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: FlatButton(
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
                    color: Colors.red[500],
                    textColor: Colors.white,
                    onPressed: _finder,
                    child: Text(
                      'Create A Program',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
