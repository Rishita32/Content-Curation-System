import 'package:CheerApp/models/usera.dart';
import 'package:CheerApp/screens/authenticate/splash.dart';
import 'package:CheerApp/screens/home/feed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Usera>(context);
    print('wrapper');
    print(user);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Splash();
    } else
      return Feed();
  }
}
