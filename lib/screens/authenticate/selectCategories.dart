import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SelectCategories extends StatefulWidget {
  @override
  _SelectCategoriesState createState() => _SelectCategoriesState();
}

class _SelectCategoriesState extends State<SelectCategories> {
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
                "Select 5 categories to help us know you better.",
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
                  _button('Animals', Icons.pets),
                  _button('Sports', Icons.games),
                  _button('Food', Icons.fastfood),
                  _button('Movies', Icons.movie),
                  _button('Books', Icons.book),
                  _button('Tech', Icons.computer),
                  _button('Travel', Icons.card_travel),
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

  Widget _button(name, iconname) => FlatButton(
        onPressed: () async {
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
            color: Colors.yellow, // button color
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
