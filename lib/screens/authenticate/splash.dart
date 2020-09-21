import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[400],
      body: Center(
          heightFactor: 40,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Cheer!",
                  style: TextStyle(
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 120),
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text('Login'),
                    color: Colors.black,
                    textColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/register');
                    },
                    child: Text('Register'),
                    color: Colors.black,
                    textColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                )
              ])),
    );
  }
}
