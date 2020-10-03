//import 'package:CheerApp/services/auth.dart';
import 'dart:convert';
import 'package:CheerApp/screens/home/main_drawer.dart';
import 'package:CheerApp/screens/home/news_model.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import './main_drawer.dart';
import 'package:http/http.dart' as http;

Future<News> getNews(String u, String apiKey) async {
  // ignore: unnecessary_brace_in_string_interps
  var url = "$u&apiKey=${apiKey}";
  var response = await http.get(url);
  if (response.statusCode == 200) {
    print(response.body);
    return News.fromJson(jsonDecode(response.body));
  } else {
    return null;
  }
}


class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  List<Articles> articles1 = List();
  List<Articles> articles2 = List();
  List<Articles> articles3 = List();

  //final AuthService _authS = AuthService();
  @override

  void initState()
  {
    super.initState();
    getNews("http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=cb8999c8da2a445c877f87790c8c12f2", 
    "cb8999c8da2a445c877f87790c8c12f2").then((n) {
      setState(() {
        articles1 = n.articles.toList();
        
      });

    });
    getNews("http://newsapi.org/v2/everything?q=bitcoin&from=2020-09-03&sortBy=publishedcb8999c8da2a445c877f87790c8c12f2cb8999c8da2a445c877f87790c8c12f2" , 
    "cb8999c8da2a445c877f87790c8c12f2").then((n) {
      setState(() {
        articles2 = n.articles.toList();
        
      });

    });
    getNews("http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=cb8999c8da2a445c877f87790c8c12f2", 
    "cb8999c8da2a445c877f87790c8c12f2").then((n) {
      setState(() {
        articles3 = n.articles.toList();
        
      });

    });
  }
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
      floatingActionButton: FloatingActionButton(  
        child: Icon(Icons.view_carousel, color: Colors.white,),
        backgroundColor: Colors.black,
      ),

      body: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: ListView(  
              scrollDirection: Axis.horizontal,
              children: <Widget> [
                Container(  
                  height: MediaQuery.of(context).size.height ,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: ListView.builder(
                    itemBuilder: (context, index){
                      return Container(  
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        height: MediaQuery.of(context).size.height / 3.5,
                        child: Column(  
                          children: <Widget>[
                            Expanded(
                              flex: 4,
                              child: Container(  
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(  
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage( 
                                    image: NetworkImage(  
                                      articles1[index].urlToImage
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                ),
                                child: Align(  
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    articles1[index].title,
                                    style: TextStyle(  
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,

                                    ),
                                  ),
                                ),
                              ),

                            ),
                            Expanded(  
                              flex: 2,
                              child: Container(  
                                margin: EdgeInsets.only(top: 8),
                                child: Column(  
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      articles1[index].source.name,
                                      style: TextStyle( color: Colors.grey),

                                    ),
                                    SizedBox( 
                                      height: 4,
                                    ),
                                    Text(  
                                      articles1[index].description.substring(0,50),
                                      style: TextStyle(  
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                      );
                    },
                    itemCount: articles1.length,
                    ),
                ),
                 Container(  
                  height: MediaQuery.of(context).size.height ,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: ListView.builder(
                    itemBuilder: (context, index){
                      return Container(  
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        height: MediaQuery.of(context).size.height / 3.2,
                        child: Column(  
                          children: <Widget>[
                            Expanded(
                              flex: 4,
                              child: Container(  
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(  
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage( 
                                    image: NetworkImage(  
                                      articles2[index].urlToImage
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                ),
                                child: Align(  
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    articles1[index].title,
                                    style: TextStyle(  
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,

                                    ),
                                  ),
                                ),
                              ),

                            ),
                            Expanded(  
                              flex: 2,
                              child: Container(  
                                margin: EdgeInsets.only(top: 8),
                                child: Column(  
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      articles2[index].source.name,
                                      style: TextStyle( color: Colors.grey),

                                    ),
                                    SizedBox( 
                                      height: 4,
                                    ),
                                    Text(  
                                      articles2[index].description.substring(0,50),
                                      style: TextStyle(  
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                      );
                    },
                    itemCount: articles2.length,
                    ),
                ),
                 Container(  
                  height: MediaQuery.of(context).size.height ,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: ListView.builder(
                    itemBuilder: (context, index){
                      return Container(  
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        height: MediaQuery.of(context).size.height / 3.4,
                        child: Column(  
                          children: <Widget>[
                            Expanded(
                              flex: 4,
                              child: Container(  
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(  
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage( 
                                    image: NetworkImage(  
                                      articles3[index].urlToImage
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                ),
                                child: Align(  
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    articles3[index].title,
                                    style: TextStyle(  
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,

                                    ),
                                  ),
                                ),
                              ),

                            ),
                            Expanded(  
                              flex: 2,
                              child: Container(  
                                margin: EdgeInsets.only(top: 8),
                                child: Column(  
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      articles3[index].source.name,
                                      style: TextStyle( color: Colors.grey),

                                    ),
                                    SizedBox( 
                                      height: 4,
                                    ),
                                    Text(  
                                      articles3[index].description.substring(0,50),
                                      style: TextStyle(  
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                      );
                    },
                    itemCount: articles3.length,
                    ),
                ),
                Container(  
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: ListView(  
                    children: List.generate(10, (index)
                    {
                      return Container(  
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        height: MediaQuery.of(context).size.height / 4,
                        decoration: BoxDecoration(color: Colors.yellow),


                      );

                    }
                    ).toList()
                  ),
                )


              ],
            ),
          )
        ],


      ),

    );
  }

 
}
