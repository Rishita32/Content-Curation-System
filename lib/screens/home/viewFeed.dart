import 'package:CheerApp/screens/home/main_drawer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import './main_drawer.dart';

class ViewFeed extends StatefulWidget {
  String value;
  ViewFeed({this.value});
  @override
  _ViewFeedState createState() => _ViewFeedState(value);
}

class _ViewFeedState extends State<ViewFeed> {
  String value;
  _ViewFeedState(this.value);
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
