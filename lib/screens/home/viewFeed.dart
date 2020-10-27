import 'package:CheerApp/screens/home/main_drawer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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

      body: SingleChildScrollView(
              child: Center(  
          child: Container(  
            child: Column(  
              children: <Widget>[
                Image.network('https://firebasestorage.googleapis.com/v0/b/content-curation-system.appspot.com/o/img2.jpeg?alt=media&token=88920ff5-b048-4b1b-9ca7-c69705e8028a'),
                SizedBox( height: 32),
                Padding(  
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text( 
                  'Idhar Title Ayega', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    
                  ),
                  
                ),
                ),
                Padding( 
                  padding: EdgeInsets.fromLTRB(13, 10, 13, 10), 
                  child: Text( 
                  
                  'Description: Epic Games, the game engine developer and creator of the wildly popular Fortnite game, is keeping the focus squarely on antitrust issues in its lawsuit against Apple as pressures mount to rein in anti-competitive practices of the world’s largest tech companie'
                , style: TextStyle( 
                  
                  fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, 

                ),)

                ), 
              Padding( 
                  padding: EdgeInsets.fromLTRB(13, 10, 13, 10), 
                  child: Text( 
                  
                  'Read More:  "https://www.newsbtc.com/analysis/btc/its-do-or-die-for-altcoins-as-bitcoin-continues-capturing-dominance/'
                , style: TextStyle( 
                  
                  fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey, 

                ),)

                ),
                SizedBox( height: 15,),
                Row(  
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(  
                      height: 40.0,
                      width:145.0 ,
                      child: Material( 
                        borderRadius: BorderRadius.circular(20),
                        shadowColor: Colors.yellowAccent,
                        color: Colors.black,
                        elevation: 7.0,
                        child: GestureDetector( 
                          onTap: (){},
                          child: Center( 
                          
                            child: Text( 
                              ' Share ',
                              style: TextStyle( fontSize: 18,color: Colors.white),
                              
                            ),
                          ),
                          
                        ),
                      )
                      
                    ),
                    SizedBox( height: 25.0,),
                     Container(  
                      height: 40.0,
                      width:145.0 ,
                      child: Material( 
                        borderRadius: BorderRadius.circular(20),
                        shadowColor: Colors.yellowAccent,
                        color: Colors.black,
                        elevation: 7.0,
                        child: GestureDetector( 
                          onTap: (){},
                          child: Center( 
                          
                            child: Text( 
                              ' Favourites ',
                              style: TextStyle( fontSize: 18,color: Colors.white),
                              
                            ),
                          ),
                          
                        ),
                      )
                      
                    ),
                    SizedBox(height: 80,),
             
                  ],
                )
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
