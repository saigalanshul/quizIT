import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sepm_project/main.dart';

class SelectTeacher extends StatefulWidget {
  @override
  _SelectTeacherState createState() => _SelectTeacherState();
}

class _SelectTeacherState extends State<SelectTeacher> {
  QuerySnapshot teachers;
  bool gotTeachers;

  void getTeachers() async {
    teachers = await Firestore.instance.collection("Teachers").getDocuments();
    setState(() {
      gotTeachers = true;
    });
  }

  @override
  void initState() {
    super.initState();
    gotTeachers = false;
    getTeachers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select teacher")),
      body: Center(
        child: gotTeachers
            ? ListView.builder(
                itemCount: teachers.documents.length,
                itemBuilder: (BuildContext context, int c) {
                  return ListTile(
                    leading: Icon(Icons.person),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ListPage(
                          title: 'QUIZ IT',
                          isTeacher: false,
                        ),
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(teachers.documents[c].data["Name"]),
                    ),
                  );
                })
            : CircularProgressIndicator(),
      ),
    );
  }
}
