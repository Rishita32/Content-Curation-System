import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SelectCategories extends StatefulWidget {
  @override
  _SelectCategoriesState createState() => _SelectCategoriesState();
}

class _SelectCategoriesState extends State<SelectCategories> {
  List<bool> pressed = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Let's set you up!",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Select some categories to help us know you better.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.orange,
                ),
              ),
            ),
            SizedBox(
                height: 400,
                child: GridView.count(crossAxisCount: 4, children: <Widget>[
                  _button('Animals', Icons.pets, 0),
                  _button('Sports', Icons.games, 1),
                  _button('Food', Icons.fastfood, 2),
                  _button('Movies', Icons.movie, 3),
                  _button('Books', Icons.book, 4),
                  _button('Tech', Icons.computer, 5),
                  _button('Travel', Icons.card_travel, 6),
                  _button('Business', Icons.business, 7),
                  /* 
                      FlatButton(
                        onPressed: () {},
                        child: ClipOval(
                          child: Material(
                            color: Colors.yellow, // button color
                            child: InkWell(
                              splashColor: Colors.orange, // inkwell color
                              child: SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.pets),
                                      Text(
                                        'Animals',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            height: 1),
                                      )
                                    ],
                                  )),
                              onTap: () {},
                            ),
                          ),
                        ),
                      ),*/
                ]))
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/feed');
        },
        backgroundColor: Colors.orange,
        child: Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _button(name, iconname, index) => FlatButton(
        onPressed: () async {
          setState(() {
            pressed[index] = !pressed[index];
          });
          FirebaseUser user = await FirebaseAuth.instance.currentUser();
          DocumentReference documentReference =
              Firestore.instance.collection('users').document(user.uid);
          DocumentSnapshot documentSnapshot = await documentReference.get();
          List categories = documentSnapshot.data['categories'];
          if (categories.contains(name) == true) {
            documentReference.updateData({
              'categories': FieldValue.arrayRemove([name])
            });
          } else {
            documentReference.updateData({
              'categories': FieldValue.arrayUnion([name])
            });
          }
        },
        child: ClipOval(
          child: Material(
            color: pressed[index]
                ? Colors.orangeAccent
                : Colors.yellow, // button color
            child: InkWell(
              splashColor: Colors.orange, // inkwell color
              child: SizedBox(
                  width: 70,
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(iconname),
                      Text(
                        name,
                        style:
                            TextStyle(fontWeight: FontWeight.bold, height: 1),
                      )
                    ],
                  )),
            ),
          ),
        ),
      );
}
