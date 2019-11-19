import 'package:firebase_auth/firebase_auth.dart';

FirebaseUser firebaseUser;

class Authen {
  Map<String, dynamic> details;

  Authen() {
    details = new Map();
  }

  void getQuestion(String email) => details.addAll({"emailID": email});

  void getAnswer(String pass) => details.addAll({"pass": pass});

}
