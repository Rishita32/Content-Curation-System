import 'package:CheerApp/models/authModel.dart';
import 'package:CheerApp/screens/authenticate/splash.dart';
import 'package:CheerApp/screens/home/chatbot.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthModel>(context);
    print('wrapper');
    print(user);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Splash();
    } else
      return Feed();
  }
}
