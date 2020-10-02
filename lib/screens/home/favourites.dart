import 'package:CheerApp/services/auth.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
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
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        backgroundColor: Colors.orange,
        buttonBackgroundColor: Colors.white,
        height: 50,
       
        items: [  
          Icon(Icons.home, size: 20, color: Colors.black,),
          Icon(Icons.favorite, size: 20, color: Colors.black,),
          Icon(Icons.chat_bubble, size: 20, color: Colors.black,),

        ],
        animationDuration: Duration(  
          milliseconds: 200
        ),
       
        onTap: (index){  
          setState(() {
            if (index == 0) Navigator.pushReplacementNamed(context, '/feed');
            if (index == 2) Navigator.pushReplacementNamed(context, '/chatBot');
          });
        }
      ), 

      );
  }

 
}
