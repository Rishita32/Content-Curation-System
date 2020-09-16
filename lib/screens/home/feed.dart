import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:intl/intl.dart';



class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}
class _FeedState extends State<Feed>
{

  void response(query) async
  {
    AuthGoogle authGoogle= await AuthGoogle(
      fileJson: "assets/service.json"
      ).build();
      Dialogflow dialogflow= Dialogflow(authGoogle: authGoogle,language: Language.english);
      AIResponse aiResponse= await dialogflow.detectIntent(query);
      setState(() {
        messages.insert(0,{
            "data":0,
            "messages": aiResponse.getListMessage()[0]["text"]["text"][0].toString()

        } );
        
      });
      print(aiResponse.getListMessage()[0]["text"]["text"][0].toString());


  }

 final messageInsert= TextEditingController();
  List<Map> messages = new List();

  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome to Cheer App"),
        backgroundColor: Colors.orange,

      ),
      body: Container(
        child: Column(
          children: <Widget>[
             Container(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text("Today, ${DateFormat("Hm").format(DateTime.now())}", 
              style:TextStyle(fontSize: 20
              ),),
              ),
        
            Flexible(
              // ignore: missing_required_param
              child: ListView.builder( 
                reverse: true,
                itemCount: messages.length,
                // ignore: missing_return
                itemBuilder: (context,index) => chat(
                  messages[index]["message"].toString(),
                  messages[index]["data"]

                )),

               ),
               SizedBox(
              height: 20,
            ),

              

            Divider( 
              height: 5,
              color: Colors.orange,

            ),
            Container( 
              child: ListTile(
                // ignore: missing_required_param
                leading: IconButton( 
                  icon: Icon(Icons.message , color: Colors.black, size: 35,),
                ),
                title: Container( 
                  height: 35,
                  decoration: BoxDecoration ( 
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromRGBO(220, 220, 220, 1)
                  ),
                  padding: EdgeInsets.only(left: 15),
                  child: TextFormField( 
                    controller: messageInsert,
                    decoration: InputDecoration(  
                      hintText: "Enter a message",
                      hintStyle: TextStyle(  
                        color: Colors.black26
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,


                    ),
                    style: TextStyle(  
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                trailing: IconButton( 
                  icon: Icon(
                    Icons.send,
                    size: 30,
                    color: Colors.orange
                  ),
                  onPressed: (){
                    if(messageInsert.text.isEmpty)
                    {
                      print("Empty Message");
                    }
                    else
                    {
                      setState(() {

                        messages.insert(0, 
                        {"data":1, "message": messageInsert.text});
                        
                      });
                      response(messageInsert.text);
                      messageInsert.clear();

                    }
                    FocusScopeNode currentFocus=FocusScope.of(context);
                    if(!currentFocus.hasPrimaryFocus)
                    {
                      currentFocus.unfocus();
                    }
                  },
                ),

              ),
            )



          ],
        )
        


      ),
    );

  }

  Widget chat(String message, int data)
  {
    return Container(  
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(  
        mainAxisAlignment: data == 1 ?  MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          data == 0? Container(  
              height: 60,
              width: 60,
              child: CircleAvatar( 
                backgroundImage: AssetImage("assets/robot.jpg"),

              ),
          ): Container(),
          Padding(
            padding: EdgeInsets.all(10),
            child: Bubble(  
              radius: Radius.circular(15),
              color: data == 0? Color.fromRGBO(23, 157, 139, 1): Colors.orangeAccent,
              elevation: 0,
              child: Padding(  
                padding: EdgeInsets.all(2),
                child: Row(  
                  mainAxisSize: MainAxisSize.min,
                  children: [ 
                    SizedBox(  
                      width: 10,
                    ),
                    Flexible(  
                      child: Container(  
                        constraints: BoxConstraints(maxWidth: 200),
                        child: Text(  
                          message,
                          style: TextStyle(  
                            color: Colors.white, fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

            ), 
          ),
            data ==1 ? Container(  
              height: 60,
              width: 60,
              child: CircleAvatar( 
              backgroundImage: AssetImage("assets/default.jpg"),


            ),
           
              ): Container(),
        ],
      ),
    );
  }
}
