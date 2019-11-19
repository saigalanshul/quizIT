import 'package:flutter/material.dart';

import 'TeacherReq.dart';

class Teacher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TeacherState();
  }
}

class TeacherState extends State<Teacher> {
  GlobalKey<FormState> formkey;
  Authen authenticate;

  @override
  void initState() {
    super.initState();
    formkey = new GlobalKey();
    authenticate = new Authen();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Quetion"),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Question',
                  icon: Icon(Icons.query_builder),
                ),
                onSaved: (str) => authenticate.getQuestion(str),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Answer',
                  icon: Icon(Icons.question_answer),
                ),
                onSaved: (str) => authenticate.getAnswer(str),
              ),
              Padding(padding: EdgeInsets.all(10.5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //login button
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.redAccent,
                    child: Text(
                      "Upload Question",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
