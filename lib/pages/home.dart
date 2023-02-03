import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymico/models/user_model.dart';
import 'package:gymico/pages/admin%20panel/admin_panel.dart';
import 'package:gymico/pages/bmi%20calculator/bmi_calculator_page.dart';
import 'package:gymico/pages/program%20page/program_page.dart';
import 'package:gymico/pages/program%20page/survey.dart';
import 'package:gymico/pages/settings%20page.dart';
import 'package:gymico/services/database.dart';
import 'package:gymico/services/weather.dart';
import 'authentication/starting.dart';
import 'info page/info.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({Key key, this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User currentUser = FirebaseAuth.instance.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String time = '';
  String weatherUrl = ' ';
  int temperature = 0;
  int programNum;
  bool isAdmin;

  Future<int> getProgramNumber() async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('Users').doc(currentUser.uid).get();
    setState(() {
      this.programNum = documentSnapshot["program number"];
      print(this.programNum.toString());
    });
  }

  Future<bool> getAdminState() async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('Users').doc(currentUser.uid).get();
    setState(() {
      this.isAdmin = documentSnapshot["admin"];
      print(this.isAdmin.toString());
    });
  }

  //setup weather
  setup() async {
    Weather weather = Weather();
    await weather.getWeather();
    setState(() {
      temperature = weather.temperature;
      time = weather.time;
      weatherUrl = weather.weatherUrl;
    });
  }

  //refresh icon
  refresh() {
    setup();
  }

  //initState
  @override
  void initState() {
    super.initState();
    setup();
    getProgramNumber();
    getAdminState();
  }

  programButton(int programNum) {
    if (programNum == null) {
      return Container(
          width: double.infinity,
          height: 75,
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              border: Border.all(color: Colors.transparent, width: 5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ],
              gradient: LinearGradient(
                colors: [Colors.white, Colors.black26],
              ),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://sporcard.mncdn.com/Img/Studio/30713/8e1205ea56e344f1b3da189ab42474a1_2_1400.jpeg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Color(0x60212121), BlendMode.darken)),
              borderRadius: BorderRadius.circular(10.0)),
          child: MaterialButton(
            child: Text(
              "Lets Select a Program",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) => ProgramCreater()));
            },
          ));
    } else {
      return Column(
        children: [
          Container(
              width: double.infinity,
              height: 75,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  border: Border.all(color: Colors.transparent, width: 5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.black26],
                  ),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://sporcard.mncdn.com/Img/Studio/30713/8e1205ea56e344f1b3da189ab42474a1_2_1400.jpeg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Color(0x60212121), BlendMode.darken)),
                  borderRadius: BorderRadius.circular(10.0)),
              child: MaterialButton(
                child: Text(
                  "See Your Program",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (programNum != null) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => ProgramPage(programNum: this.programNum)));
                  } else {
                    print("sorry :(");
                  }
                },
              )),
          // SizedBox(height: 20),
          Container(
              height: 75,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  border: Border.all(color: Colors.transparent, width: 5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.black26],
                  ),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.arttekflooring.com/uploads/default/projects/23cd31f0a7e464b3867fd7850a2cd09a_big_r.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Color(0x60212121), BlendMode.darken)),
                  borderRadius: BorderRadius.circular(10.0)),
              child: MaterialButton(
                child: Text(
                  "Lets Select a New Program",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) => ProgramCreater()));
                },
              )),
        ],
      );
    }
  }

  bmiButton(double bmi) {
    return Container(
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          border: Border.all(color: Colors.transparent, width: 5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ],
          gradient: LinearGradient(
            colors: [Colors.white, Colors.black26],
          ),
          image: DecorationImage(
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToTN73U8Z6Ba_BAXq19yVilI8QLcTnfD7HZA&usqp=CAU'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Color(0x60212121), BlendMode.darken)),
          borderRadius: BorderRadius.circular(10.0)),
      child: MaterialButton(
        child: Text(
          "BMI Calculator\nCurrent BMI: " + bmi.toString(),
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BmiCalculator()));
        },
      ),
    );
  }

  adminButton(bool isAdmin) {
    if (isAdmin == true) {
      return Container(
          width: double.infinity,
          height: 75,
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              border: Border.all(color: Colors.transparent, width: 5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ],
              gradient: LinearGradient(
                colors: [Colors.white, Colors.black26],
              ),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://firmajans.com.tr/wp-content/uploads/2019/07/google-adwords-reklam-rotasyonu-ayarlar-1-1.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Color(0x60212121), BlendMode.darken)),
              borderRadius: BorderRadius.circular(10.0)),
          child: MaterialButton(
            child: Text(
              "Admin Page",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AdminPanel()));
            },
          ));
    } else {
      return Container(
        height: 1,
        width: 1,
      );
    }
  }

  infoPage() {
    return Container(
        width: double.infinity,
        height: 75,
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            border: Border.all(color: Colors.transparent, width: 5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ],
            gradient: LinearGradient(
              colors: [Colors.white, Colors.black26],
            ),
            image: DecorationImage(
                image:
                    NetworkImage('https://www.humanium.org/en/wp-content/uploads/2019/09/pic2-1024x665.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Color(0x60212121), BlendMode.darken)),
            borderRadius: BorderRadius.circular(10.0)),
        child: MaterialButton(
          child: Text(
            "Information Page",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => InfoPage()));
          },
        ));
  }

  displayWeather() {
    if (this.temperature == 0) {
      return CircularProgressIndicator();
    } else {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Text(
                temperature.toString() + ' °C',
                style: TextStyle(fontSize: 25.0, color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              child: Image.network(
                weatherUrl,
                width: 60,
                height: 45,
              ),
            ),
            SizedBox(height: 5.0),
            Container(
                child: Text(
              'İzmir',
              style: TextStyle(fontSize: 15.0, color: Colors.red, fontWeight: FontWeight.bold),
            )),
            SizedBox(height: 5.0),
            Container(
                child: Text(
              'Time: ' + time,
              style: TextStyle(fontSize: 15.0, color: Colors.red, fontWeight: FontWeight.bold),
            )),
            IconButton(
                icon: Icon(Icons.refresh),
                color: Colors.red,
                onPressed: () {
                  refresh();
                }),
            SizedBox(height: 5.0),
          ],
        ),
      );
    }
  }

  final Map<String, dynamic> _formData = {'Data': null}; //***************** anlamadım **********************
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // http.post("https://gymico-default-rtdb.firebaseio.com/sentence.json",body: json.encode(_formData));
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Users>(
        stream: DatabaseService().userData,
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Users userData = snapshot.data;
            return Scaffold(
              backgroundColor: Colors.grey[300],
              appBar: AppBar(
                title: Text("Home Page", style: TextStyle(color: Colors.white)),
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => SettingsPage()));
                    },
                  ),
                ],
                leading: IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    _signOut().whenComplete(() {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => Starting()));
                    });
                  },
                ),
              ),
              key: _scaffoldKey,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        displayWeather(),
                        programButton(userData.programNumber),
                        adminButton(userData.admin),
                        infoPage(),
                        bmiButton(userData.bmi),
                      ],
                    ),
                  ),
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

  Future _signOut() async {
    await _auth.signOut();
  }
}
