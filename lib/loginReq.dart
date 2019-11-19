import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sepm_project/main.dart';

FirebaseUser firebaseUser;

class Authenticate {
  Map<String, dynamic> details;

  Authenticate() {
    details = new Map();
  }

  void getEmail(String email) => details.addAll({"emailID": email});

  void getPass(String pass) => details.addAll({"pass": pass});

  void getName(String pass) => details.addAll({"name": pass});

  void getRegNo(String pass) => details.addAll({"regno": int.parse(pass)});

  void Login(GlobalKey<FormState> formkey, BuildContext context) async {
    FormState state = formkey.currentState;
    if (state.validate()) {
      state.save();
      AuthResult result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: details["emailID"], password: details["pass"]);
      if (result.user != null) {
        firebaseUser = result.user;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => ListPage(title: 'QUIZ IT'),
            ), ModalRoute.withName(':'));
      }
    }
  }

  void SignUp(GlobalKey<FormState> formkey, BuildContext context) async {
    FormState state = formkey.currentState;
    if (state.validate()) {
      state.save();
      print(details);
      try {
        AuthResult result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: details["emailID"], password: details["pass"]);
        print(result.toString());
      }
      catch (e) {
        print(e.toString());
      }
//
//      if(result.user!=null){
      print("in");
      firebaseUser = await FirebaseAuth.instance.currentUser();
      if (firebaseUser != null) {
        details.remove("pass");
        print(details);
        await Firestore.instance.collection("Users").document(
            firebaseUser.uid).setData({
          'Name': details["name"],
          'emailID': details["emailID"],
          'RegNo': details["regno"]
        });
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => ListPage(title: 'QUIZ IT'),
            ), ModalRoute.withName(':'));
      }
    }
  }
}
