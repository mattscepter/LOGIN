
import 'package:demo/wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:demo/animated_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'login.dart';
import 'auth.dart';
class MyHomePage extends StatefulWidget{
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  final myController = TextEditingController();
  int _selectedIndex=0;
  final List<Widget>_list=[
    inorout1(),
    inorout2(),
    inorout3(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('INorOUT',style: TextStyle(fontFamily:'DoHyeon',fontWeight: FontWeight.bold,fontSize:35,color: Colors.white)),
        centerTitle: true,
        elevation: 10.0,

      ),
      body: _list[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),title:Text('Home',style: TextStyle(fontFamily: 'DoHyeon',fontSize: 17))),
          BottomNavigationBarItem(icon: Icon(Icons.thumbs_up_down),title:Text('Vote',style: TextStyle(fontFamily: 'DoHyeon',fontSize: 17))),
          BottomNavigationBarItem(icon: Icon(Icons.list),title:Text('Recents',style: TextStyle(fontFamily: 'DoHyeon',fontSize: 17))),
    ],
        fixedColor: Color(0xFF33691E),
        currentIndex:_selectedIndex,
        onTap: ItemTapped,
        unselectedItemColor: Color(0xFFBDBDBD),
        elevation: 10.0,

    ),
    );
  }

  void ItemTapped(int index) {
       setState(() {
         _selectedIndex=index;
       });

  }


}
class inorout1 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[100], Colors.blue[400]],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 40),
              Text(
                'NAME',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'EMAIL',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                email,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              RaisedButton(
                onPressed: () {
                  AuthProvider().signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPage();}), ModalRoute.withName('/'));
                },
                color: Colors.deepPurple,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              )
            ],
          ),
        ),
      ),
    );;
  }


}
class inorout2 extends StatelessWidget{
  final fb=FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var _firebaseRef = fb.reference().child('demo');
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
                  child: Text('Caste Your Vote 2',style: TextStyle(fontSize: 35,fontFamily: 'DoHyeon'),),
                )
            ),
            new Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(child: AnimatedButton(text: 'IN',onPressed:(){
                    _firebaseRef.push().set({
                      "flag": '1',
                    });
                    final snackBar = SnackBar(
                      content: Text('Sucess 2'),
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                  )),
                  Container(child: AnimatedButton(text: 'OUT',onPressed:(){
                    _firebaseRef.push().set({
                      "message":'0'
                    });
                    final snackBar = SnackBar(
                      content: Text('Double Sucess 2'),
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                  },))
                ],
              ),
            ),
          ],
        ),
      ) ,
    );
  }

}

class inorout3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //appBar: AppBar(
        //title:Text('INorOUT',style: TextStyle(fontFamily:'DoHyeon',fontWeight: FontWeight.bold,fontSize:35,color: Colors.white)),
        //centerTitle: true,
        //elevation: 10.0,
      //),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          recent(
              status: "Successfull",
              date:"26/10/2019",
              time:"11:38 PM",
              image:"thumpup.png",
          ),
          recent(
            status: "Unsuccessfull",
            date:"25/10/2019",
            time:"04:30 PM",
            image:"thumpdown.png",
          ),
          recent(
            status: "Unsuccessfull",
            date:"24/10/2019",
            time:"02:22 PM",
            image:"thumpdown.png",
          ),
          recent(
            status: "Successfull",
            date:"23/10/2019",
            time:"09:38 AM",
            image:"thumpup.png",
          ),
          recent(
            status: "Successfull",
            date:"22/10/2019",
            time:"10:45 AM",
            image:"thumpup.png",
          ),
          recent(
            status: "Successfull",
            date:"21/10/2019",
            time:"12:39 PM",
            image:"thumpup.png",
          ),
          recent(
            status: "Unsuccessfull",
            date:"20/10/2019",
            time:"01:38 PM",
            image:"thumpdown.png",
          )
        ],
      )
    );
  }

}
class recent extends StatelessWidget{
  final String date;
  final String status;
  final String time;
  final String image;
  recent({Key key,this.status,this.date,this.time,this.image}): super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
        padding: EdgeInsets.all(3),
        height: 80,
        child: Card(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                    child: Image.asset("assets/images/"+this.image,scale: 10.5,),
                  ),
                  new Align(
                    alignment: Alignment.centerLeft,
                      child: Container(
                          padding: EdgeInsets.fromLTRB(60, 5, 0, 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(this.status,
                                  style: TextStyle(fontFamily:'DoHyeon')),
                              Text(this.date),
                              Text("Time-" + this.time),
                            ],
                          ))
                  )
                ])));

  }

}

