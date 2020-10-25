//import 'package:CheerApp/services/auth.dart';
import 'package:CheerApp/screens/home/main_drawer.dart';
import 'package:bubble/bubble.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:intl/intl.dart';
import './main_drawer.dart';

class ChatBot extends StatefulWidget {
  
  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  //final AuthService _authS = AuthService();

  void response(query) async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/chatbot.json").build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    setState(() {
      messages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
      });
    });
    print(aiResponse.getListMessage()[0]["text"]["text"][0].toString());
  }

  final messageController = TextEditingController();
  List<Map> messages = new List();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome to Cheer App"),
        backgroundColor: Colors.orange,
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
      body: Container(
          child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 10),
            child: Text(
              "Today, ${DateFormat("Hm").format(DateTime.now())}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Flexible(
            // ignore: missing_required_param
            child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                // ignore: missing_return
                itemBuilder: (context, index) => chat(
                    messages[index]["message"].toString(),
                    messages[index]["data"])),
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
                icon: Icon(
                  Icons.message,
                  color: Colors.black,
                  size: 35,
                ),
              ),
              title: Container(
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromRGBO(220, 220, 220, 1)),
                padding: EdgeInsets.only(left: 15),
                child: TextFormField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: "Enter a message",
                    hintStyle: TextStyle(color: Colors.black26),
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
                icon: Icon(Icons.send, size: 30, color: Colors.orange),
                onPressed: () {
                  if (messageController.text.isEmpty) {
                    print("Empty Message");
                  } else {
                    setState(() {
                      messages.insert(
                          0, {"data": 1, "message": messageController.text});
                    });
                    response(messageController.text);
                    messageController.clear();
                  }
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
              ),
            ),
          )
        ],
      )),
      bottomNavigationBar: CurvedNavigationBar(  
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
            if (index == 0) Navigator.pushReplacementNamed(context, '/feed');
            if (index == 1) Navigator.pushReplacementNamed(context, '/favourites');
            
          });
        }
      ),
    );
  }

  Widget chat(String message, int data) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Bubble(
          radius: Radius.circular(15.0),
          color: data == 0 ? Colors.orangeAccent : Colors.orangeAccent,
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
                      data == 0 ? "assets/robot.jpg" : "assets/default.jpg"),
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

  
}