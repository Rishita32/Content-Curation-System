import 'package:flutter/material.dart';

class SelectCategories extends StatelessWidget {
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
                height: 300,
                child: GridView.count(crossAxisCount: 4,
                    // primary: false,
                    // padding: const EdgeInsets.all(20),
                    // crossAxisSpacing: 10,
                    // mainAxisSpacing: 10,
                    children: <Widget>[
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
                      ),
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
                                      Icon(Icons.games),
                                      Text(
                                        'Sports',
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
                      ),
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
                                      Icon(Icons.fastfood),
                                      Text(
                                        'Food',
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
                      ),
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
                                      Icon(Icons.movie),
                                      Text(
                                        'Movies',
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
                      ),
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
                                      Icon(Icons.book),
                                      Text(
                                        'Books',
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
                      ),
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
                                      Icon(Icons.business),
                                      Text(
                                        'Business',
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
                      ),
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
                                      Icon(Icons.computer),
                                      Text(
                                        'Tech',
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
                      ),
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
                                      Icon(Icons.card_travel),
                                      Text(
                                        'Travel',
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
                      ),
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
                      ),
                    ]))
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/feed');
        },
        backgroundColor: Colors.orange,
        child: Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
      ),
    );
  }
}
