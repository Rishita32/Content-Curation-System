import 'package:CheerApp/models/usera.dart';
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
    return StreamProvider<Usera>.value(
        value: AuthService().user,
        child: MaterialApp(
          home: Wrapper(),
          // initialRoute: '/login',
          routes: {
            '/splash': (context) => Splash(),
            '/login': (context) => Login(),
            '/register': (context) => Register(),
          },
        ));
  }
}

// appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.orange),
//       ),

// floatingActionButton: FloatingActionButton(
//   onPressed: () {},
//   backgroundColor: Colors.orange,
//   child: Icon(
//     Icons.arrow_forward,
//     color: Colors.black,
//   ),
// ),
