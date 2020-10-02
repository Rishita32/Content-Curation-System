import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget{
  static String routeName;

  

  @override 
  Widget build(BuildContext context)
  {
  
    return Scaffold( 
      backgroundColor: Colors.white,
      body: Stack(  
        overflow: Overflow.visible,
        children: <Widget>[  
          Container(
            color: Colors.orange,
            height: 40 ,
            child: Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 10 * SizeConfig.heightMultiplier),
              child: Column(  
                children: <Widget>[
                  Row(  
                    children: <Widget> [ 
                      Container(  
                        height: 11 * SizeConfig.heightMultiplier,
                        width: 22 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(  
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTHexai3IrhzkvM_JukWXENhN-8mCDXE0Y7_w&usqp=CAU'),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      SizedBox(width: 5 ),
                      Column(  
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Text("User Name" ,
                          style: TextStyle(  
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                          ),

                        ],
                      ) 


                    ],
                  )

                ],
              ),
            ),
                        
            )
            
                    ]
                  ), 
            
                );
            
              }
            }
            
            mixin SizeConfig {
  static num heightMultiplier;

  static num widthMultiplier;
}