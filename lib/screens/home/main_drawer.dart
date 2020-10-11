import 'package:flutter/material.dart';
import './user_profile.dart';

class MainDrawer extends StatelessWidget{
  @override 
  Widget build(BuildContext context)
  {
    return Drawer( 
      
        child: Column(
          children: <Widget> [ 
            Container(  
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.orange,
              child: Center(  
                child: Column(  
                  children: <Widget> [  
                    Container(  
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(
                        top :30,
                        bottom: 10,
                        ),

                      decoration: BoxDecoration( 
                        shape: BoxShape.circle,
                        image: DecorationImage( 
                          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTHexai3IrhzkvM_JukWXENhN-8mCDXE0Y7_w&usqp=CAU'),
                          fit: BoxFit.fill
                          )
                          
                      ),
                    ),
                    Text(  
                      'User Name',
                      style: TextStyle (  
                        fontSize: 22,
                        color: Colors.black
                      ),

                    ),
                      Text(  
                      'rishitamote@gmail.com',
                      style: TextStyle (  
                        
                        color: Colors.black
                      ),

                    ),
                  ],
                ),
              ),
            ),
            ListTile(  
              leading: Icon( Icons.person),
              title: Text('Profile',
               style: TextStyle( fontSize :18,)
               ),
               onTap: () {  
                 Navigator.of(context).pushNamed(UserProfile.routeName);
               }
               ,
            ),
            ListTile(  
              leading: Icon( Icons.settings),
              title: Text('Settings',
               style: TextStyle( fontSize :18,)
               ),
               onTap: null,
            ),
               ListTile(  
              leading: Icon( Icons.help),
              title: Text('Help & Support',
               style: TextStyle( fontSize :18,)
               ),
               onTap: null,
            ),
            ListTile(  
              leading: Icon( Icons.arrow_back),
              title: Text('Logout',
               style: TextStyle( fontSize :18,)
               ),
               onTap: null,
            ),

          ],
          )
    );
  }
}