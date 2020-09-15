import 'package:CheerApp/models/authModel.dart';
import 'package:CheerApp/screens/authenticate/selectCategories.dart';
import 'package:CheerApp/screens/home/feed.dart';
import 'package:CheerApp/services/auth.dart';
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
    return StreamProvider<AuthModel>.value(
        value: AuthService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
          // initialRoute: '/login',
          routes: {
            '/splash': (context) => Splash(),
            '/login': (context) => Login(),
            '/register': (context) => Register(),
            '/feed': (context) => Feed(),
            '/selectCategories': (context) => SelectCategories(),
          },
        ));
  }
}

// appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.orange),
//       ),
