import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sepm_project/teachers_page.dart';

import './detail_page.dart';
import './lesson.dart';
import './login.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'Raleway'),
      home: new Login(),

      // home: DetailPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title, @required this.isTeacher, this.teacherref})
      : super(key: key);
  final bool isTeacher;
  final String title;
  final DocumentReference teacherref;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List lessons;
  QuerySnapshot quizes;
  bool gotQuizes;

  void getQuizes() async {
    quizes = await widget.teacherref.collection("Quizes").getDocuments();
    setState(() {
      gotQuizes = true;
    });
  }

  @override
  void initState() {
    lessons = getLessons();
    super.initState();
    gotQuizes = false;
    getQuizes();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Lesson lesson) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.home, color: Colors.white),
      ),
      title: Text(
        lesson.title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                // tag: 'hero',
                child: LinearProgressIndicator(
                    backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                    value: lesson.indicatorValue,
                    valueColor: AlwaysStoppedAnimation(Colors.green)),
              )),
          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(lesson.level,
                    style: TextStyle(color: Colors.white))),
          )
        ],
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: () {
        if (!widget.isTeacher)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailPage(lesson: lesson,
                        quiz: quizes.documents[lessons.indexOf(lesson)],)));
        else
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      Teacher(lessons.indexOf(lesson)))
          );
      },
    );

    Card makeCard(Lesson lesson) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: makeListTile(lesson),
      ),
    );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: (widget.isTeacher || gotQuizes) ? ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.isTeacher ? 5 : quizes.documents.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index]);
        },
      ) : CircularProgressIndicator(),
    );

    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.blur_on, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.assistant, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(child: Text("QuizIT")),
            ListTile(title: Text("Logout"),
                leading: Icon(Icons.power_settings_new),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ), ModalRoute.withName(':'));
                })
          ],
        ),
      ),
      body: makeBody,
      bottomNavigationBar: makeBottom,
    );
  }
}

List getLessons() {
  return [
    Lesson(
        title: "Quiz 1",
        level: "1",
        indicatorValue: 0.33,
        price: 20,
        content: "Yet to be published"),
    Lesson(
        title: "Quiz 2",
        level: "1",
        indicatorValue: 0.33,
        price: 50,
        content: "Yet to be published"),
    Lesson(
        title: "Quiz 3",
        level: "3 ",
        indicatorValue: 0.66,
        price: 30,
        content: "Yet to be published"),
    Lesson(
        title: "Quiz 4",
        level: "3",
        indicatorValue: 0.66,
        price: 30,
        content: "Yet to be published"),
    Lesson(
        title: "Quiz 5",
        level: "5",
        indicatorValue: 1.0,
        price: 50,
        content: "Yet to be published"),
    Lesson(
        title: "Quiz 6",
        level: "5",
        indicatorValue: 1.0,
        price: 50,
        content: "Yet to be published"),
    Lesson(
        title: "Quiz 7",
        level: "5",
        indicatorValue: 1.0,
        price: 50,
        content: "Yet to be published"),
  ];
}
