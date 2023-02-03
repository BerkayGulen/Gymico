import 'package:flutter/material.dart';
import 'package:gymico/pages/authentication/signUp.dart';
import 'package:gymico/services/auth.dart';
import '../home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController =
      TextEditingController(); //whenever the user modifies a text field , text field updates value
  final TextEditingController _passwordController = TextEditingController();
  AuthService _auth = new AuthService();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
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
          ),
          withEmailPassword(),
        ],
      ),
    );
  }

  Widget withEmailPassword() {
    Text text = Text("Do not you have an account ?");
    return Expanded(
      flex: 1,
      child: SingleChildScrollView(
        child: Form(
          //form acts like a container for grouping and validating
          key: _formKey,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                    validator: (String val) {
                      // to be ensure the textformfield is not empty
                      if (val.isEmpty) {
                        return "pls enter some text";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                    validator: (String val) {
                      if (val.isEmpty) {
                        return "pls enter some text";
                      }
                      return null;
                    },
                  ),
                  Container(
                    padding: EdgeInsets.all(32),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: RaisedButton(
                        color: Colors.blue[300],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.blue[900]),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            dynamic result = await _auth.signInWithEmailAndPassword(
                                this._emailController.text, this._passwordController.text);
                            if (result == null) {
                              _scaffoldKey.currentState
                                  .showSnackBar(SnackBar(content: Text("Failed to signin")));
                            } else {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
                            }
                          }
                        },
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return SignUpPage();
                      }));
                    },
                    child: Container(
                      child: Center(child: text),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
