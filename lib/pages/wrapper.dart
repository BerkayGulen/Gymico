import 'package:flutter/material.dart';
import 'package:gymico/models/user_model.dart';
import 'package:provider/provider.dart';
import 'authentication/starting.dart';
import 'home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Users user = Provider.of<Users>(context);
    if (user == null) {
      return Starting();
    } else {
      return HomePage();
    }
  }
}
