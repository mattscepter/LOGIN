import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googlesignin/auth.dart';


class MyHomePage extends StatefulWidget {
  final FirebaseUser currentUser;
  MyHomePage(this.currentUser);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Text("hi"),
              new FlatButton(onPressed: (){
                Authprovider().signOutGoogle();
                Navigator.pushNamed(context, '/second');
              }, child:Text("Sign Out"))
            ],

          )
        ),
      ),
    );
  }

}