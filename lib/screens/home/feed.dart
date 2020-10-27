//import 'package:CheerApp/models/category.dart';
import 'package:CheerApp/screens/home/main_drawer.dart';
import 'package:CheerApp/screens/home/viewFeed.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import './main_drawer.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  //Future<FirebaseUser> currentUser = FirebaseAuth.instance.currentUser();
  //DocumentReference documentReference = Firestore.instance.collection('users').document(currentUser.uid);
  //DocumentSnapshot documentSnapshot = await documentReference.get();
  //List categories = documentSnapshot.data['categories'];
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
          stream: Firestore.instance.collection('content').where('categoryId',
              arrayContainsAny: ['Tech', 'Sports']).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Text("loading");
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot content = snapshot.data.documents[index];
                    return Stack(
                      children: <Widget>[
                        Column(children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 350.0,
                            child: Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Material(
                                color: Colors.white,
                                elevation: 14.0,
                                shadowColor: Color(0x80219673),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 200.0,
                                          child: Image.network(
                                            '${content['imageUrl']}',
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          '${content['title']}',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        InkWell(
                                          child: Text(
                                            '${content['description']}'
                                                .substring(0, 70),
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey),
                                          ),
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) => ViewFeed(
                                                        value:
                                                            '${content['description']}')));
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * .47,
                            right: MediaQuery.of(context).size.height * .52,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: CircleAvatar(
                              backgroundColor: Color(0xff543B7A),
                              child: Sharebutton(content: content),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * .47,
                            left: MediaQuery.of(context).size.height * .52,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: CircleAvatar(
                              backgroundColor: Color(0xff543B7A),
                              child: new IconButton(
                                icon: Icon(Icons.favorite),
                                color: Colors.white,
                                onPressed: () async {
                                  FirebaseUser user =
                                      await FirebaseAuth.instance.currentUser();
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
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            }
          }),
    );
  }

  void share(BuildContext context, DocumentSnapshot content) {
    final RenderBox box = context.findRenderObject();
    final String text = '${content['title']}';
    //final String
    Share.share(text,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}

class Sharebutton extends StatelessWidget {
  const Sharebutton({
    Key key,
    @required this.content,
  }) : super(key: key);

  final DocumentSnapshot content;

  @override
  Widget build(BuildContext context) {
    return new IconButton(
        icon: new Icon(Icons.share),
        color: Colors.white,
        onPressed: () {
          final RenderBox box = context.findRenderObject();
          final String text = '${content['title']}';
          //final String
          Share.share(text,
              sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
        });
  }
}
