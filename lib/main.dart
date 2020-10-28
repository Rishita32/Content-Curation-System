import 'package:CheerApp/models/user.dart';
import 'package:CheerApp/screens/authenticate/selectCategories.dart';
import 'package:CheerApp/screens/home/chatbot.dart';
import 'package:CheerApp/screens/home/favourites.dart';
import 'package:CheerApp/screens/home/feed.dart';
import 'package:CheerApp/screens/home/settings.dart';
import 'package:CheerApp/screens/home/userProfile.dart';
import 'package:CheerApp/screens/home/viewFeed.dart';
import 'package:flutter/material.dart';
import 'package:CheerApp/screens/authenticate/login.dart';
import 'package:CheerApp/screens/authenticate/register.dart';
import 'package:CheerApp/screens/authenticate/splash.dart';
import 'package:CheerApp/screens/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: User().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
          // initialRoute: '/login',
          routes: {
            '/splash': (context) => Splash(),
            '/login': (context) => Login(),
            '/register': (context) => Register(),
            '/feed': (context) => Feed(),
            '/chatBot': (context) => ChatBot(),
            '/selectCategories': (context) => SelectCategories(),
            '/favourites': (context) => Favourites(),
            '/userProfile': (context) => UserProfile(),
            '/viewfeed': (context) => ViewFeed(),
            '/settings':(context) => AppSettings(),
          },
        ));
  }
}
