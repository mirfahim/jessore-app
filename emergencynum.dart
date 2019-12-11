import 'package:firebaseconnection1/jessoreblog.dart';
import 'package:firebaseconnection1/product.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home.dart';
import 'jessoreblog.dart';



class NumApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyNumPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyNumPage extends StatefulWidget {
  MyNumPage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyNumPageState createState() => _MyNumPageState();
}

class _MyNumPageState extends State<MyNumPage> {
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: new Text('Emergency Numbers', style:TextStyle(fontSize: 18.0)),
         actions: <Widget>[
          new IconButton(
            icon:new Icon(Icons.shopping_basket) ,
             onPressed: () => debugPrint ('search button pressed'),


          ),
        ],

      ),

     drawer: new Drawer(
         child: new ListView(
           children: <Widget>[
            new DrawerHeader(
              
             child: Text(' ', style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue[900],)),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage("assets/jessore1.jpg"),
                     fit: BoxFit.fill),
          //     accountEmail: new Text('Be a part of this Community'),
          //  ),
              ),
            ),

          new ListTile(
               title: new Text('Home page'),
               leading: new Icon(Icons.home,color:Colors.blue),
               onTap: () {
                 Navigator.of(context).pop();
                 Navigator.of(context).push(new MaterialPageRoute(
                   builder: (BuildContext context) =>
                   new DataApp(),
                 ));
               },


             ),
            
             new ListTile(
               title: new Text('Tourist Spot'),
               leading: new Icon(Icons.place,color:Colors.blue),

             ),
             new ListTile(
               title: new Text('Jashore Blog'),
               leading: new Icon(Icons.textsms,color:Colors.blue),
               onTap: () {
                 Navigator.of(context).pop();
                 Navigator.of(context).push(new MaterialPageRoute(
                   builder: (BuildContext context) =>
                   new DataApp(),
                 ));
               },


             ),
             new ListTile(
               title: new Text('Rare Products'),
               leading: new Icon(Icons.shop,color:Colors.blue),
               onTap: () {
                 Navigator.of(context).pop();
                 Navigator.of(context).push(new MaterialPageRoute(
                   builder: (BuildContext context) =>
                   new ProductApp(),
                 ));
               },

             ),
             new ListTile(
              title: new Text('Service'),               leading: new Icon(Icons.room_service,color:Colors.blue),

            ),
             new Divider(color: Colors.blue,height:10.0,),
            new ListTile(
              title: new Text('Close Bar'),
               leading: new Icon(Icons.close,color:Colors.blue),
              onTap: (){
                Navigator.of(context).pop();
              },

            ),
          ],

        ),
      ),
       
       
     
      body:StreamBuilder(
        stream: Firestore.instance.collection('numbers').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            const Text('loading');
          }
          else{
            return ListView.builder(
              itemCount:snapshot.data.documents.length ,

              itemBuilder:(context, index){
                DocumentSnapshot mynumbers=snapshot.data.documents[index];
                return Stack(
                  children: <Widget>[
                    Column( children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150.0,

                      child: Padding(
                        padding: EdgeInsets.only(top:8.0, bottom: 8.0),
                        child: Material(
                          color:Colors.white,
                          elevation: 11,
                          shadowColor: Color(0x802196F3),
                          child: Center(child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                // Container(
                                //   width: MediaQuery.of(context).size.width,
                                //   height: 200,
                                //   // child: Image.network(
                                //     // '${mypost['image']}',
                                //     fit: BoxFit.fill,

                                //   ),
                                // ),
                                SizedBox(height: 18,),
                                Text('${mynumbers['title']}',
                                style:TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10.0,),
                                Text('${mynumbers['num']}',
                                style:TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color:Colors.blue),
                                ),
                              ],
                            ),
                          ),),
                        ),

                      ),

                    ),
                    ],
                    ),
                  ],

                );
              } ,
            );
          }
        },

      ) ,

    );

  }
  }
