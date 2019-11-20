import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './lesson.dart';

class DetailPage extends StatefulWidget {
  final Lesson lesson;
  final int num;

  DetailPage({Key key, this.lesson, this.num}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DocumentSnapshot snapshot;

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
        SizedBox(height: 100.0),
        Icon(
          Icons.home,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          widget.lesson.title,
          style: TextStyle(color: Colors.white, fontSize: 25.0),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 1, child: levelIndicator),
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 7.50),
                    child: Text(
                      widget.lesson.level,
                      style: TextStyle(color: Colors.white),
                    ))),
            Expanded(flex: 1, child: coursePrice)
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery
                .of(context)
                .size
                .height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("drive-steering-wheel.jpg"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.5,
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
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    Widget bottomContent() {
      return SizedBox();
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
        children: <Widget>[topContent],
      ),
    );
  }
}
