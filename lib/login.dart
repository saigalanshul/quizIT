import 'package:flutter/material.dart';
import 'package:sepm_project/sign_up_page.dart';

import './main.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
              builder: (context) => ListPage(title: 'QUIZ IT'),
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Image.asset(
              'images/appLogo.png',
              width: 150.0,
              height: 150.0,
            ),
            TextField(
              controller: _userController,
              decoration: InputDecoration(
                hintText: 'Username',
                icon: Icon(Icons.person),
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            Padding(padding: EdgeInsets.all(10.5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //login button
                RaisedButton(
                  onPressed: _showWelcome,
                  color: Colors.redAccent,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),

                // clear button
                RaisedButton(
                  onPressed: _erase,
                  color: Colors.redAccent,
                  child: Text(
                    "Clear",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.all(8.5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Sign up button
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => sign_up_page(),
                        ));
                  },
                  color: Colors.redAccent,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(10.5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _userController.text.isEmpty ||
                      _passwordController.text.isEmpty
                      ? "Please Enter Your Username and Password"
                      : "Welcome, $_welcomeString",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
