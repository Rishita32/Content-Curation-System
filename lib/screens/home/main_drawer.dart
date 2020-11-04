import 'package:CheerApp/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final User _authS = User();

  /*String userID = "";
  String userName = "";
  String userEmail = "";

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
      setState(() async {
        userID = user.uid;
        print(userID);
        DocumentReference documentReference =
            Firestore.instance.collection('users').document(userID);
        DocumentSnapshot documentSnapshot = await documentReference.get();
        userName = documentSnapshot.data['userName'];
        userEmail = documentSnapshot.data['userEmail'];
        print(userEmail);
      });
    });
  }*/

  Stream<DocumentSnapshot> getData() async* {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    yield* Firestore.instance
        .collection('users')
        .document(user.uid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getData(),
        builder: (context, snapshot) {
          DocumentSnapshot user = snapshot.data;
          return Drawer(
              child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: Colors.orange,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(
                          top: 30,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTHexai3IrhzkvM_JukWXENhN-8mCDXE0Y7_w&usqp=CAU'),
                                fit: BoxFit.fill)),
                      ),
                      Text(
                        '${user['userName']}',
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                      Text(
                        '${user['userEmail']}',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile',
                    style: TextStyle(
                      fontSize: 18,
                    )),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/userProfile');
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings',
                    style: TextStyle(
                      fontSize: 18,
                    )),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/settings');
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Help & Support',
                    style: TextStyle(
                      fontSize: 18,
                    )),
                onTap: null,
              ),
              ListTile(
                leading: Icon(Icons.arrow_back),
                title: Text('Logout',
                    style: TextStyle(
                      fontSize: 18,
                    )),
                onTap: () async {
                  await _authS.signOut();
                  Navigator.pop(context);
                },
              ),
            ],
          ));
        });
  }
}
