import 'package:firebase_auth/firebase_auth.dart';
import 'package:gymico/models/user_model.dart';
import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseService _dataBaseService = new DatabaseService();
  User currentUser = FirebaseAuth.instance.currentUser;

  //auth change user stream
  Stream<Users> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Users _userFromFirebaseUser(User user) {
    return user != null ? Users(uid: user.uid, email: user.email) : null;
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password

  Future registerWithEmailAndPassword(String email, String password, String displayName) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      await user.updateProfile(displayName: displayName);
      await _dataBaseService.updateUserData(email, user.uid, displayName);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
