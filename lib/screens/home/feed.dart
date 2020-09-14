import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}
  
  class _FeedState extends State<Feed> {
    void response(query) async{
      AuthGoogle authGoogle = await AuthGoogle(fileJson: "assets/cheer-a319f-7574a652fe56.json")
      .build();
      Dialogflow dialogflow = Dialogflow(authGoogle: authGoogle, language:Language.english);      
      AIResponse aiResponse = await dialogflow.detectIntent(query);
      setState(() {
      messsages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
      });
    });
    }

    final messageInsert = TextEditingController();
  List<Map> messsages = List();
  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Row(
        children:<Widget>
        [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width/3,
            decoration: BoxDecoration(
              color: Colors.orange
            ),
            child: Icon(Icons.home),
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width/3,
            decoration: BoxDecoration(
              color: Colors.orange
            ),
            child: Icon(Icons.favorite),
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width/3,
            decoration: BoxDecoration(
              color: Colors.orange
            ),
            child: Icon(Icons.chat),
          )

        ] 

      ),

      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Welcome to Cheer App",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.orange,
        
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) => chat(
                        messsages[index]["message"].toString(),
                        messsages[index]["data"]))),
            Divider(
              height: 5.0,
              color: Colors.deepOrange,
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: TextField(
                    controller: messageInsert,
                    decoration: InputDecoration.collapsed(
                        hintText: "Send your message",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                  )),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconButton(
                      
                        icon: Icon(
                          
                          Icons.send,
                          size: 30.0,
                          color: Colors.deepOrange,
                        ),
                        onPressed: () {
                          if (messageInsert.text.isEmpty) {
                            print("empty message");
                          } else {
                            setState(() {
                              messsages.insert(0,
                                  {"data": 1, "message": messageInsert.text});
                            });
                            response(messageInsert.text);
                            messageInsert.clear();
                          }
                        }),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }
  Widget chat(String message, int data) {
    // ignore: non_constant_identifier_names
    var BubbleNip;
        return Padding(
          padding: EdgeInsets.all(10.0),
          child: Bubble(
                    radius: Radius.circular(15.0),
                    color: data == 0 ? Colors.deepOrange : Colors.orangeAccent,
                    elevation: 0.0,
                    alignment: data == 0 ? Alignment.topLeft : Alignment.topRight,
                    nip: data == 0 ? BubbleNip.leftBottom : BubbleNip.rightTop,
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            data == 0 ? "assets/bot.png" : "assets/user.png"),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                          child: Text(
                        message,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))
                    ],
                  ),
                )),
          );
        }
      
        // ignore: non_constant_identifier_names
        Bubble({Radius radius, ColorSwatch<int> color, double elevation, Alignment alignment, nip, Padding child}) {}
}

