import 'package:CheerApp/services/auth.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final AuthService _authS = AuthService();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cheer!"),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _authS.signOut();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.black,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Feed'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Favourites'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('ChatBot'))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    if (index == 1) Navigator.pushReplacementNamed(context, '/favourites');
    if (index == 2) Navigator.pushReplacementNamed(context, '/chatBot');
  }
}
