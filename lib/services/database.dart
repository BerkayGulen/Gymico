import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gymico/models/exercise_model.dart';
import 'package:gymico/models/user_model.dart';

class DatabaseService {
  //collection reference
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('Users');
  User currentUser = FirebaseAuth.instance.currentUser;
  final String programName;
  DatabaseService({this.programName});

  Future updateUserData(String email, String uid, String displayName) async {
    try {
      await usersCollection.doc(uid).set({
        "email": email,
        "uid": uid,
        "display name": displayName,
        "program number": null,
        "bmi": null,
        "avatar": "assets/avatars/avatar2.jpg",
        "admin": false,
        "goal weight": null,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future updateProgramNumber(int programNum) async {
    return await usersCollection.doc(currentUser.uid).update({"program number": programNum});
  }

  Future updateBmiAndGoalWeight(double bmi, double goalWeight) async {
    return await usersCollection.doc(currentUser.uid).update({"bmi": bmi, "goal weight": goalWeight});
  }

  Future updateDisplayName(String newDisplayName) async {
    return await usersCollection.doc(currentUser.uid).update({"display name": newDisplayName});
  }

  Future updateAvatar(String avatarUrl) async {
    return await usersCollection.doc(currentUser.uid).update({"avatar": avatarUrl});
  }

  // user list from snapshot
  List<Users> _userListFromFirebase(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Users(
        displayName: doc.data()["display name"] ?? "",
        email: doc.data()["email"] ?? "",
        uid: doc.data()["uid"] ?? "",
        programNumber: doc.data()["program number"] ?? null,
        bmi: doc.data()["bmi"] ?? null,
        avatar: doc.data()["avatar"] ?? "assets/avatars/avatar2.jpg",
        goalWeight: doc.data()["goal weight"] ?? null,
        admin: doc.data()["admin"] ?? false,
      );
    }).toList();
  }

  List<Exercises> _exerciseListFromFirebase(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Exercises(
        name: doc.data()["name"],
        gif: doc.data()["gif"],
      );
    }).toList();
  }

  Stream<List<Users>> get users {
    return usersCollection.snapshots().map(_userListFromFirebase);
  }

  Stream<Users> get userData {
    return usersCollection.doc(currentUser.uid).snapshots().map(_userDataFromFirebase);
  }

  Stream<List<Exercises>> get exercises {
    CollectionReference program = FirebaseFirestore.instance.collection(programName);
    return program.snapshots().map(_exerciseListFromFirebase);
  }

  Users _userDataFromFirebase(DocumentSnapshot snapshot) {
    return Users(
      displayName: snapshot.data()["display name"] ?? "",
      email: snapshot.data()["email"] ?? "",
      programNumber: snapshot.data()["program number"] ?? null,
      bmi: snapshot.data()["bmi"] ?? null,
      avatar: snapshot.data()["avatar"] ?? "assets/avatars/avatar2.jpg",
      admin: snapshot.data()["admin"] ?? false,
      goalWeight: snapshot.data()["goal weight"] ?? null,
    );
  }
}
