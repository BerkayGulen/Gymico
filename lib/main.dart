import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gymico/pages/wrapper.dart';
import 'package:gymico/services/auth.dart';
import 'package:provider/provider.dart';
import 'models/user_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.blueGrey[900]),
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Starting(),
//     );
//   }
// }

//      theme: ThemeData(primaryColor: Colors.orange),
//      debugShowCheckedModeBanner: false,
