import 'package:flutter/material.dart';
import 'package:normal/HomePage.dart';

import 'LoginAndRegistration.dart';
import 'UserStatus.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

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
                    "Login"
                  ),
                  onPressed: () {
                    if(UserStatus.username == _usernameController.text && 
                            UserStatus.password == _passwordController.text) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (Route<dynamic> route) => false,
                      );
                    } else {
                      return _showMyDialog();
                    }
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
          title: Text('Login Failed!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Wrong Credentials.'),
                Text('Looks like you typed the login details wrongly?'),
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