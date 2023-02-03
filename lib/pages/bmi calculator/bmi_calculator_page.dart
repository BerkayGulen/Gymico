import 'package:flutter/material.dart';
import 'package:gymico/pages/home.dart';
import 'package:gymico/services/database.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  DatabaseService _databaseService = new DatabaseService();

  @override
  double _weight = 70;
  double _goalWeight = 70;
  double _height = 165;
  int age = 30;
  bool _male = true;
  String gender;
  bool _female = false;
  bool _hasBeenPressed1 = false;
  bool _hasBeenPressed2 = false;
  double bmi = 22.12;
  double height = 1.11;
  double distance = 1.11;

  void _calculate() {
    height = (_height / 100);
    bmi = (_weight / (height * height));
    distance = _weight - _goalWeight;
    print(bmi);
    _databaseService.updateBmiAndGoalWeight(bmi, this._goalWeight);
  }

  Future<Null> _showAlertDialog(double bmi) async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (_) {
          return AlertDialog(
            content: Container(
              height: 100,
              width: 100,
              child: Text("your bmi is: " + bmi.toString()),
            ),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
                },
                color: Colors.black54,
                child: Text("go to home page"),
              )
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CALCULATOR"),
        backgroundColor: Colors.blueGrey[900],
        leading: IconButton(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: Container(
        color: Colors.grey[300],
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1 / 1.10,
                    child: Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: _hasBeenPressed1 ? Colors.blueGrey[700] : Colors.blueGrey[800],
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Column(children: [
                          IconButton(
                            icon: Icon(MdiIcons.genderFemale),
                            color: Colors.white,
                            tooltip: 'Female',
                            onPressed: () {
                              setState(() {
                                _female = true;
                                _male = false;
                                _hasBeenPressed1 = !_hasBeenPressed1;
                                _hasBeenPressed2 = false;
                                gender = "female";
                              });
                            },
                          ),
                          Text(
                            "Female",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 7, color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ]),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1 / 1.10,
                    child: Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: _hasBeenPressed2 ? Colors.blueGrey[700] : Colors.blueGrey[800],
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Column(children: [
                          IconButton(
                            icon: Icon(MdiIcons.genderMale),
                            color: Colors.white,
                            tooltip: 'Male',
                            onPressed: () {
                              setState(() {
                                _female = false;
                                _male = true;
                                _hasBeenPressed2 = !_hasBeenPressed2;
                                _hasBeenPressed1 = false;
                                gender = "male";
                              });
                            },
                          ),
                          Text(
                            "Male",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 7, color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey[800],
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Column(
                children: [
                  Text(
                    "WEIGHT",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      _weight.toStringAsFixed(0),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "kg",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                  Slider(
                    activeColor: Colors.red[700],
                    inactiveColor: Colors.grey,
                    value: _weight,
                    min: 20,
                    max: 130,
                    divisions: 130,
                    label: _weight.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _weight = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey[800],
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Column(
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      _height.toStringAsFixed(0),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "cm",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                  Slider(
                    activeColor: Colors.red[700],
                    inactiveColor: Colors.grey,
                    value: _height,
                    min: 120,
                    max: 220,
                    divisions: 100,
                    label: _height.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _height = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[800], borderRadius: BorderRadius.all(Radius.circular(15.0))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(MdiIcons.minusBox, color: Colors.white, size: 35),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(width: 10.0),
                              IconButton(
                                icon: Icon(MdiIcons.plusBox, color: Colors.white, size: 35),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[800], borderRadius: BorderRadius.all(Radius.circular(15.0))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'GOAL WEIGHT',
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text(
                            _goalWeight.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(MdiIcons.minusBox, color: Colors.white, size: 35),
                                onPressed: () {
                                  setState(() {
                                    _goalWeight--;
                                  });
                                },
                              ),
                              SizedBox(width: 10.0),
                              IconButton(
                                icon: Icon(
                                  MdiIcons.plusBox,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _goalWeight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.red[700],
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: FlatButton(
                onPressed: () {
                  _calculate();
                  _showAlertDialog(bmi);
                },
                child: Text(
                  "CALCULATE",
                  style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
