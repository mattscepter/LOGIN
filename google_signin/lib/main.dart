import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googlesignin/auth.dart';
import 'homepage.dart';
import 'login.dart';
import 'splashpage.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider<Authprovider>(
    child: MyApp(), create: (BuildContext context) {
    return Authprovider();
  },
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
    home: FutureBuilder<FirebaseUser>(
    future: Provider.of<Authprovider>(context).getCurrentUser(),
    builder: (context, AsyncSnapshot<FirebaseUser> snapshot) { //          ⇐ NEW
    if (snapshot.connectionState == ConnectionState.done) {
    // log error to console                                            ⇐ NEW
    if (snapshot.error != null) {
    print("error");
    return Text(snapshot.error.toString());
    }
    // redirect to the proper page, pass the user into the
    // `HomePage` so we can display the user email in welcome msg     ⇐ NEW
    return snapshot.hasData ? MyHomePage(snapshot.data) : Login();
    } else {
    // show loading indicator                                         ⇐ NEW
    return LoadingCircle();
    }
    }
    )
    );
  }
}
class LoadingCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CircularProgressIndicator(),
        alignment: Alignment(0.0, 0.0),
      ),
    );
  }
}

