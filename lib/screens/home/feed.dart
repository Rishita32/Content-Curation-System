//import 'package:CheerApp/services/auth.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
//import 'package:CheerApp/models/category.dart';
import 'package:CheerApp/screens/home/main_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import './main_drawer.dart';


class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
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
              
              bottomNavigationBar: curvedNavigationBar,
              // ignore: missing_required_param
              body: StreamBuilder(  
                stream: Firestore.instance.collection("content").snapshots(),
                // ignore: missing_return
                builder: (context, snapshot){
                  if(!snapshot.hasData){
                    const Text("loading");
                  }
                  else
                  {
                    return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context,index){
                        DocumentSnapshot content=snapshot.data.documents[index];
                        return Stack( 
                          children: <Widget>[
                            Column( children: <Widget>[
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
                                            width: MediaQuery.of(context).size.width,
                                            height: 200.0,
                                            child: Image.network(
                                              '${content['imageUrl']}',
                                              fit: BoxFit.fill,

                                            ),
                                          ),
                                          SizedBox(height: 10.0,),
                                          Text('${content['title']}',
                                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),

                                          ),
                                          SizedBox(height: 10.0,),
                                           Text('${content['description']}',
                                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold ,color: Colors.blueGrey),

                                          ),
                                  
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )

                            ] ),
                            Container(  
                              alignment: Alignment.topRight,
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height *.47,
                                left: MediaQuery.of(context).size.height *.52,
                            
                              ),
                              child: Container(  
                                width: MediaQuery.of(context).size.width,
                                child: CircleAvatar(  
                                  backgroundColor: Color( 0xff543B7A),
                                  child: Icon(Icons.favorite, color: Colors.white, size: 20.0,),
                                ),
                              ),
                            )

                            
                          ], 

                        );

                      }
                    );
                      
                  }
                  

                }

              ),
            );
          }
        
         
        }
 
