import 'package:CheerApp/models/user.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //final AuthService _auth = AuthService();
  final User _auth = User();
  final _formKey = GlobalKey<FormState>();
  String name, email, password, confirmPassword;
  String error = '';

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Text(
            'Create Your Account',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 25,
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
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'Enter your name' : null,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Name'),
                  )),
              Padding(
                  padding: EdgeInsets.all(5),
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
                  padding: EdgeInsets.all(5),
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
              Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    validator: (value) =>
                        value != password ? 'Enter the same password' : null,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        confirmPassword = value;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                  )),
              FlatButton(
                onPressed: () {},
                child: Text(
                    "By creating an account you agree to our Terms of Service and Privacy Policy"),
              ),
              RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password, name);
                    if (result == null) {
                      setState(() {
                        error = 'Please supply a valid email';
                      });
                    } else {
                      print("user registered");
                      Navigator.pushReplacementNamed(
                          context, '/selectCategories');
                      setState(() {
                        error = 'user registered';
                      });
                    }
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text('Register'),
                color: Colors.black,
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
              
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
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: Container(
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
