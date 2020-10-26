import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';

class Splash extends StatefulWidget {
  State<StatefulWidget> createState() => StartState();

  
}
class StartState extends State<Splash>
{
  @override
  Widget build(BuildContext context){
    return initScreen(context);
  }
  @override 
  void initState()
  {
    super.initState();
    startTimer();
  }
  startTimer() async{
    var duration= Duration(seconds: 3);
    return new Timer(duration,route);
  }
  route(){
    Navigator.pushReplacement(context, MaterialPageRoute( 
      builder: (context) => Login()
    ));
  }
  
  initScreen(BuildContext context)
  {
    return Scaffold(  
      backgroundColor: Colors.white,
      body: Center(  
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[  
            Container( 
              child: Image.asset("assets/cheer.png"),
              decoration: BoxDecoration(  
                shape: BoxShape.circle,
                color: Colors.orange,
              

              ),
              margin: EdgeInsets.all(55.0),
              padding: EdgeInsets.all(55.0),
            
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text( 
              "Let's get started",
              style: TextStyle(  
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),

            ),
             Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
        
          ],
        ),
      ),
    );
  }

 
}