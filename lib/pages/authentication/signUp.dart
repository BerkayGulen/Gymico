import 'package:flutter/material.dart';
import 'package:gymico/services/auth.dart';
import 'package:gymico/services/database.dart';
import '../home.dart';
import 'login.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _displayName = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthService _auth = new AuthService();
  DatabaseService _dataBaseService = new DatabaseService();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(23),
              child: Container(
                child: Image(
                  image: AssetImage('assets/images/gymico.jpeg'),
                  height: 250,
                  width: 250,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(23),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: _displayName,
                            decoration: InputDecoration(labelText: "Full Name"),
                            validator: (val) {
                              if (val.isEmpty) {
                                return "pls enter something";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(labelText: "Email"),
                            validator: (val) {
                              if (val.isEmpty) {
                                return "pls enter something";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(labelText: "Password"),
                            validator: (val) {
                              if (val.isEmpty) {
                                return "pls enter something";
                              }
                              return null;
                            },
                          ),
                          Container(
                            padding: EdgeInsets.all(32),
                            child: SizedBox(
                              width: 150,
                              height: 50,
                              child: RaisedButton(
                                color: Colors.blue[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    await _auth.registerWithEmailAndPassword(this._emailController.text,
                                        this._passwordController.text, this._displayName.text);
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
                                  }
                                },
                                child: Text(
                                  "Register",
                                  style: TextStyle(color: Colors.blue[900]),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return LoginPage();
                              }));
                            },
                            child: Container(
                              child: Text("Do you have an account ? "),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
