import 'package:CheerApp/models/user.dart';
//import 'package:CheerApp/services/auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //final AuthService _auth = AuthService();
  final User _auth = User();
  final _formKey = GlobalKey<FormState>();

  String email, password;
  String error = '';
  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Text(
            'cheer!',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainer() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.45,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'Enter your email address' : null,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Email'),
                  )),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (value) => value.length < 6
                        ? 'Enter a password with at least 6 characters'
                        : null,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Password'),
                  )),
              FlatButton(
                onPressed: () {},
                child: Text("Forgot Password? "),
              ),
                 FlatButton(
                onPressed: () {},
                child: Text("Create new account? "),
              ),
              RaisedButton(
                onPressed: () async {
                  print(email);
                  print(password);
                  if (_formKey.currentState.validate()) {
                    dynamic result =
                        await _auth.logInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Credentials were not identified';
                      });
                    } else {
                      Navigator.pushReplacementNamed(context, '/feed');
                      setState(() {
                        error = '';
                      });
                    }
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text('Login'),
                color: Colors.black,
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
              SizedBox(height: 12),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14),
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(70),
                  bottomRight: const Radius.circular(70),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildLogo(),
              _buildContainer(),
            ],
          )
        ],
      ),
    ));
  }
}
