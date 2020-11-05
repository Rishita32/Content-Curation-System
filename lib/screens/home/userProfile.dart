import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './main_drawer.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => new _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Stream<DocumentSnapshot> getData() async* {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    print(user.uid);
    yield* Firestore.instance
        .collection('users')
        .document(user.uid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<User>(context);
    //print(user.userId);
    //FirebaseUser user = await FirebaseAuth.instance.currentUser();
    // ignore: dead_code
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
            if (index == 0) Navigator.pushReplacementNamed(context, '/feed');
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
            style: TextStyle(color: Colors.white),
          ),
        ),
        drawer: MainDrawer(),
        bottomNavigationBar: curvedNavigationBar,
        body: StreamBuilder(
            stream: getData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: Container(
                        child: const Text(
                  "Loading...",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                )));
              } else {
                return new Stack(
                  children: <Widget>[
                    ClipPath(
                      child: Container(
                        color: Colors.black.withOpacity(0.8),
                      ),
                      clipper: getClipper(),
                    ),
                    Positioned(
                      width: 350.0,
                      left: 25.0,
                      top: MediaQuery.of(context).size.height / 5,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 150.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTHexai3IrhzkvM_JukWXENhN-8mCDXE0Y7_w&usqp=CAU'),
                                    fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(75.0)),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 7.0, color: Colors.black),
                                ]),
                          ),
                          SizedBox(height: 50.0),
                          Text(
                            snapshot.data['userName'],
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            snapshot.data['userEmail'],
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Container(
                            height: 50.0,
                            width: 200.0,
                            child: Material(
                                borderRadius: BorderRadius.circular(20),
                                shadowColor: Colors.yellowAccent,
                                color: Colors.black,
                                elevation: 4.0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      'Update Profile',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                )),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            height: 50.0,
                            width: 200.0,
                            child: Material(
                                borderRadius: BorderRadius.circular(20),
                                shadowColor: Colors.yellowAccent,
                                color: Colors.black,
                                elevation: 4.0,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/selectCategories');
                                  },
                                  child: Center(
                                    child: Text(
                                      'Update Categories',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }
            }));
  }
}

// ignore: camel_case_types
class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
