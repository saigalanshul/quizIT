import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './lesson.dart';

class DetailPage extends StatefulWidget {
  final Lesson lesson;
  final DocumentSnapshot quiz;

  DetailPage({Key key, this.lesson, this.quiz}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
//  DocumentSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: widget.lesson.indicatorValue,
            valueColor: AlwaysStoppedAnimation(Colors.green)),
      ),
    );

    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        "\$" + widget.lesson.price.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );

    final topContentText = new ListView(
      //crossAxisAlignment: CrossAxisAlignment.start,

      children: <Widget>[
        Text(
          widget.lesson.title,
          style: TextStyle(color: Colors.white, fontSize: 25.0),
        ),
        SizedBox(height: 15),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
//        Container(
//            padding: EdgeInsets.only(left: 10.0),
//            height: MediaQuery
//                .of(context)
//                .size
//                .height * 0.5,
//            decoration: new BoxDecoration(
//              image: new DecorationImage(
//                image: new AssetImage("drive-steering-wheel.jpg"),
//                fit: BoxFit.cover,
//              ),
//            )),
        Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.15,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
      ],
    );

    Widget getbottomContent() {
      Map<String, String>x;
      return Expanded(
        child: ListView.builder(
          itemCount: widget.quiz.data.length,
          itemBuilder: (BuildContext context, int c) {
            print(widget.quiz.data["ques" + c.toString()]);
            return Card(
              margin: EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Q" + (c + 1).toString() + ": " +
                        widget.quiz.data["ques" + c.toString()].keys.elementAt(
                            0).toString()),
                    TextField(decoration: InputDecoration(
                        prefixIcon: Icon(Icons.question_answer),
                        hintText: "Ans"
                    ),),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("QuizIT"),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(child: Text("QuizIT")),
            ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.power_settings_new),
              onTap: () => FirebaseAuth.instance.signOut(),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          topContent,
          getbottomContent(),
          RaisedButton(
            onPressed: null,
            child: Text("Submit"),
          )
        ],
      ),
    );
  }
}
