import 'package:CheerApp/screens/home/main_drawer.dart';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './main_drawer.dart';

// ignore: camel_case_types
class viewFeed extends StatefulWidget {
  @override
  _viewFeedState createState() => _viewFeedState();
}
// ignore: camel_case_types
class _viewFeedState extends State<viewFeed>{
  @override
  Widget build(BuildContext context) {
    var curvedNavigationBar = CurvedNavigationBar(
        color: Colors.white,
        backgroundColor: Colors.orange,
        buttonBackgroundColor: Colors.white,
        height: 50,
        items: [
          Icon(
            Icons.home,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.favorite,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.chat_bubble,
            size: 20,
            color: Colors.black,
          ),
        ],
        animationDuration: Duration(milliseconds: 200),
        onTap: (index) {
          setState(() {
            if (index == 1)
              Navigator.pushReplacementNamed(context, '/favourites');
            if (index == 2) Navigator.pushReplacementNamed(context, '/chatBot');
          });
        });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text(
          "Cheer!",
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: curvedNavigationBar,
    );


  }
}