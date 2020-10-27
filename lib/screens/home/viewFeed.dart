import 'package:CheerApp/screens/home/main_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './main_drawer.dart';

// ignore: must_be_immutable
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
      body: StreamBuilder(
          stream: Firestore.instance
              .collection('content')
              .document(value)
              .snapshots(),
          builder: (context, snapshot) {
            var content = snapshot.data;
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Image.network('${content['imageUrl']}'),
                      SizedBox(height: 32),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text(
                          '${content['title']}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(13, 10, 13, 10),
                          child: Text(
                            '${content['description']}',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.fromLTRB(13, 10, 13, 10),
                          child: Text(
                            '${content['articleUrl']}',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              height: 40.0,
                              width: 145.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20),
                                shadowColor: Colors.yellowAccent,
                                color: Colors.black,
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      ' Share ',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 25.0,
                          ),
                          Container(
                              height: 40.0,
                              width: 145.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20),
                                shadowColor: Colors.yellowAccent,
                                color: Colors.black,
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () async {
                                    FirebaseUser user = await FirebaseAuth
                                        .instance
                                        .currentUser();
                                    final Firestore _firestore =
                                        Firestore.instance;
                                    try {
                                      await _firestore
                                          .collection("favorites")
                                          .document()
                                          .setData({
                                        'userId': user.uid,
                                        'contentId': '${content['contentId']}'
                                      });
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      ' Favourites ',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 80,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
