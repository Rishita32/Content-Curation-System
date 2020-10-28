import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './main_drawer.dart';

class AppSettings extends StatefulWidget{
  @override  
  _SettingsState createState()=> new _SettingsState();
}

class _SettingsState extends State<AppSettings>{
   Stream<DocumentSnapshot> getData() async* {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    print(user.uid);
    yield* Firestore.instance
        .collection('users')
        .document(user.uid)
        .snapshots();
  }
  @override  
  
  Widget build(BuildContext context){

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
              
        
              ),
              drawer: MainDrawer(),
              bottomNavigationBar: curvedNavigationBar,
              body: StreamBuilder(
                stream: getData(),
                builder: (context, snapshot) {
                  return SingleChildScrollView( 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children:<Widget> [
                        Card(  
                          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0) ),
                          margin: const EdgeInsets.all(8.0),
                          color: Colors.yellow,
                          child: ListTile(
                            onTap: (){},
                            title: Text(  
                              snapshot.data['userName'],
                              style: TextStyle(  
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            leading: CircleAvatar(  
                              backgroundImage: (
                                AssetImage('assets/user1.png')
                                
                              ),
                          ),
                      
                      ),
                        ),
                        SizedBox( height: 15.0,),
                        Padding( 
                          padding: EdgeInsets.fromLTRB(13, 10, 13, 10),
                          child:Text(
                          'Notification Settings', style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),

                        ), 
                        ),

                        Padding( 
                          padding: EdgeInsets.fromLTRB(13, 10, 13, 10),
                          child:  SwitchListTile(
                          
                          activeColor: Colors.orange,
                          contentPadding: EdgeInsets.all(0),
                          title: Text('Recieved Notification'),
                          value: true, 
                          onChanged: (val){}
                          ),

                        ),
                        
                       
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: SwitchListTile(
                          activeColor: Colors.yellow,
                          contentPadding: EdgeInsets.all(0),
                          title: Text('Display Notification Dot'),
                          value: false, 
                          onChanged: (val){}
                          ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: SwitchListTile(
                          activeColor: Colors.yellow,
                          contentPadding: EdgeInsets.all(0),
                          title: Text('Save Chatbot Chats'),
                          value: false, 
                          onChanged: (val){}
                          ),
                           ),

                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: SwitchListTile(
                          activeColor: Colors.orange,
                          contentPadding: EdgeInsets.all(0),
                          title: Text('Share Feed'),
                          value: true, 
                          onChanged: (val){}
                          ),
                           ),

                      ]

                  ),

      );
                }
              )
              );
  }
}