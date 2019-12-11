import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'emergencynum.dart';
import 'home.dart';



class ProductApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyProductPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyProductPage extends StatefulWidget {
  MyProductPage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyProductPageState createState() => _MyProductPageState();
}

class _MyProductPageState extends State<MyProductPage> {
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        title: new Text('Jessore Blog'),
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

             ),
             new ListTile(
               title: new Text('Rare Products'),
               leading: new Icon(Icons.shop,color:Colors.blue),

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
        stream: Firestore.instance.collection('product').snapshots(),
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
