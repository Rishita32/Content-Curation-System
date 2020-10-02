//import 'package:CheerApp/services/auth.dart';
import 'package:CheerApp/screens/home/main_drawer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import './main_drawer.dart';


class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  //final AuthService _authS = AuthService();
  @override
  Widget build(BuildContext context) {
    var curvedNavigationBar = CurvedNavigationBar(  
        color: Colors.white,
        backgroundColor: Colors.orange,
        buttonBackgroundColor: Colors.white,
        height: 50,
       
        items:[  
          Icon(Icons.home, size: 20, color: Colors.black,),
          Icon(Icons.favorite, size: 20, color: Colors.black,),
          Icon(Icons.chat_bubble, size: 20, color: Colors.black,),

        ],
        animationDuration: Duration(  
          milliseconds: 200
        ),
        
        onTap: (index){  
          setState(() {
            
            if (index == 1) Navigator.pushReplacementNamed(context, '/favourites');
            if (index == 2) Navigator.pushReplacementNamed(context, '/chatBot');
          });
        }
      );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text("Cheer!" , 
        style: TextStyle(color: Colors.black) ,
        ),
      
        // actions: <Widget>[
        //   FlatButton.icon(
        //     icon: Icon(Icons.person),
        //     label: Text('logout'),
        //     onPressed: () async {
        //       await _authS.signOut();
        //       Navigator.pop(context);
        //     },
        //   ),
        // ],
      ),
      drawer: MainDrawer(),
      
      bottomNavigationBar: curvedNavigationBar
    );
  }

 
}
