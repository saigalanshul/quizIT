import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseUser firebaseUser;

class Authen {
  Map<String, dynamic> details;
  static int ans;

  Authen() {
    details = new Map();
    ans = 0;
  }

  void getQuestion(String email) => details.addAll({"ques": email});

  void getAnswer(String pass) => details.addAll({"ans": pass});

  Future<void> uploadQues(GlobalKey<FormState>formkey, BuildContext context,
      int num) async {
    FormState state = formkey.currentState;
    if (state.validate()) {
      state.save();
      await Firestore.instance
          .collection("Quizes")
          .document("quiz" + num.toString())
          .setData({
        'ques' + ans.toString(): {details["ques"]: details["ans"]},
//        'ans'+ans.toString(): details["ans"],
//        'Reg?No': details["regno"]
      }, merge: true);
      ans++;
      formkey.currentState.reset();
    }
  }

}
