import 'package:firebaseconnection1/jessoreblog.dart';
import 'package:firebaseconnection1/product.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'emergencynum.dart';
import 'jessoreblog.dart';



class DataApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyDataPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyDataPage extends StatefulWidget {
  MyDataPage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyDataPageState createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text('My Jessore'),
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
            new UserAccountsDrawerHeader(
             accountName: new Text('Jessorian',),
              accountEmail: new Text('Be a part of this Community'),
           ),

          
            new ListTile(
               title: new Text('Emergency Numbers'),
               leading: new Icon(Icons.phone,color:Colors.blue),
               onTap: () {
                 Navigator.of(context).pop();
                 Navigator.of(context).push(new MaterialPageRoute(
                   builder: (BuildContext context) =>
                   new NumApp(),
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
                   new BlogApp(),
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
        stream: Firestore.instance.collection('post').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            const Text('loading');
          }
          else{
            return ListView.builder(
              itemCount:snapshot.data.documents.length ,

              itemBuilder:(context, index){
                DocumentSnapshot mypost=snapshot.data.documents[index];
                return Stack(
                  children: <Widget>[
                    Column( children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 350.0,

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
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  child: Image.network(
                                    '${mypost['image']}',
                                    fit: BoxFit.fill,

                                  ),
                                ),
                                SizedBox(height: 18,),
                                Text('${mypost['title']}',
                                style:TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10.0,),
                                Text('${mypost['subtitle']}',
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
