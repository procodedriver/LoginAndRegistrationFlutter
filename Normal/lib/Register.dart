import 'package:flutter/material.dart';
import 'package:normal/LoginAndRegistration.dart';
import 'package:normal/UserStatus.dart';

import 'Login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter the username",
              ),
              controller: _usernameController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter the password",
              ),
              controller: _passwordController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RaisedButton(
                  color: Colors.green,
                  child: Text(
                    "Register"
                  ),
                  onPressed: () {
                    String username = _usernameController.text;
                    String password = _passwordController.text;
                    UserStatus.username = username;
                    UserStatus.password = password;
                    return _showMyDialog();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registration Success!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Navigating to login and registration page.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Okey'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginAndRegistration()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }

}