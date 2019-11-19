import 'package:flutter/material.dart';


class sign_up_page extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new sign_up_pageState();
  }
}

class sign_up_pageState extends State<sign_up_page> {
  final TextEditingController _userName = new TextEditingController();
  final TextEditingController _userNumber = new TextEditingController();
  final TextEditingController _useremail= new TextEditingController();
  final TextEditingController _userPassword = new TextEditingController();


  String _welcomeString = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sign Up"),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),

      backgroundColor: Colors.blueGrey,
      body: Center(
        child: new ListView(
          children: <Widget>[

        new TextField(
          controller: _userName,
          decoration: new InputDecoration(
            hintText: 'Username',
            icon: new Icon(Icons.person),

          ),
        ),
        new TextField(
          controller: _userNumber,
          decoration: new InputDecoration(
            hintText: 'Registration Number',
            icon: new Icon(Icons.confirmation_number),

          ),


          obscureText: true,
        ),


            new TextField(
              controller: _userPassword,
              decoration: new InputDecoration(
                hintText: 'Password',
                icon: new Icon(Icons.lock_outline),

              ),


              obscureText: true,
            ),

        new TextField(
          controller: _useremail,
          decoration: new InputDecoration(
            hintText: 'email id',
            icon: new Icon(Icons.email),

          ),


          obscureText: true,
        ),
        ]
        ),
      ),
    );
  }

}







