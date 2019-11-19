import 'package:flutter/material.dart';
import 'package:sepm_project/sign_up_page.dart';
//import './secondpage.dart';
//import './thirdpage.dart';
import './main.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcomeString = "";

  void _erase() {
    setState(() {
      _passwordController.clear();
      _userController.clear();
    });
  }

  void _showSignUp() {
    setState(() {});
  }

  void _showWelcome() {
    setState(() {
      if (_userController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty)
        _welcomeString = _userController.text;
      else
        _welcomeString = "Welcome, Nothing";

      if (_userController.text == "Anshul" &&
          _passwordController.text == "anshul") {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => new ListPage(title: 'QUIZ IT'),
            ));
      } else {
        _welcomeString = "Please Sign Up First";
      }

      @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
          alignment: Alignment.topCenter,
          child: new ListView(
            children: <Widget>[
              new Image.asset(
                'images/appLogo.png',
                width: 150.0,
                height: 150.0,
              ),
              new Container(
                width: 360.0,
                height: 180.0,
                color: Colors.blueGrey,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _userController,
                      decoration: new InputDecoration(
                        hintText: 'Username',
                        icon: new Icon(Icons.person),
                      ),
                    ),
                    new TextField(
                      controller: _passwordController,
                      decoration: new InputDecoration(
                        hintText: 'Password',
                        icon: new Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    new Padding(padding: new EdgeInsets.all(10.5)),
                    new Center(
                      child: new Row(
                        children: <Widget>[
                          //login button
                          new Container(
                            margin: const EdgeInsets.only(left: 40),
                            child: new RaisedButton(
                              onPressed: _showWelcome,
                              color: Colors.redAccent,
                              child: new Text(
                                "Login",
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),

                          // clear button
                          new Container(
                            margin: const EdgeInsets.only(left: 150),
                            child: new RaisedButton(
                              onPressed: _erase,
                              color: Colors.redAccent,
                              child: new Text(
                                "Clear",
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              new Padding(padding: new EdgeInsets.all(8.5)),
              new Center(
                  child: new Row(
                children: <Widget>[
                  // Sign up button
                  new Container(
                    margin: const EdgeInsets.only(left: 150),
                    child: new RaisedButton(
                      onPressed:() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                               sign_up_page(),
                            ));
                      },
                      color: Colors.redAccent,
                      child: new Text(
                        "Sign Up",
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              new Padding(padding: new EdgeInsets.all(10.5)),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    _userController.text.isEmpty ||
                            _passwordController.text.isEmpty
                        ? "Please Enter Your Username and Password"
                        : "Welcome, $_welcomeString",
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
