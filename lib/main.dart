import 'package:flutter/material.dart';
import 'package:CheerApp/screens/login.dart';
import 'package:CheerApp/screens/register.dart';
import 'package:CheerApp/screens/splash.dart';

void main() => runApp(MaterialApp(
      // home: Splash(),
      // initialRoute: '/login',
      routes: {
        '/': (context) => Splash(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
      },
    ));


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