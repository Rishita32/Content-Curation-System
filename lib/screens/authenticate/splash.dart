import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
          heightFactor: 40,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "cheer!",
                  style: TextStyle(
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text('Login'),
                  color: Colors.black,
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text('Register'),
                  color: Colors.black,
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                )
              ])),
    );
  }
}
