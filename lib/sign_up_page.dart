import 'package:flutter/material.dart';
import 'package:sepm_project/loginReq.dart';

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
  final TextEditingController _useremail = new TextEditingController();
  final TextEditingController _userPassword = new TextEditingController();
  GlobalKey<FormState> formkey;
  Authenticate authenticate;

  @override
  void initState() {
    super.initState();
    formkey = new GlobalKey();
    authenticate = new Authenticate();
//  String _welcomeString = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Sign Up"),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Form(
          key: formkey,
          child: new ListView(children: <Widget>[
            new TextFormField(
              controller: _userName,
              decoration: new InputDecoration(
                hintText: 'Name',
                icon: new Icon(Icons.person),
              ),
              onSaved: (str) => authenticate.getName(str),
            ),
            new TextFormField(
              controller: _userNumber,
              decoration: new InputDecoration(
                hintText: 'Registration Number',
                icon: new Icon(Icons.confirmation_number),
              ),

              onSaved: (str) => authenticate.getRegNo(str),

//            obscureText: true,
            ),
            new TextFormField(
              controller: _userPassword,
              decoration: new InputDecoration(
                hintText: 'Password',
                icon: new Icon(Icons.lock_outline),
              ),
              onSaved: (str) => authenticate.getPass(str),
              obscureText: true,
            ),
            new TextFormField(
              controller: _useremail,
              decoration: new InputDecoration(
                hintText: 'email id',
                icon: new Icon(Icons.email),
              ),
              onSaved: (str) => authenticate.getEmail(str),

//            obscureText: true,
            ),
            RaisedButton(
              onPressed: () => authenticate.SignUp(formkey, context, false),
              child: Text("S SignUp"),
            ),
            RaisedButton(
              onPressed: () => authenticate.SignUp(formkey, context, true),
              child: Text("T SignUp"),
            ),
          ]),
        ),
      ),
    );
  }
}
