import 'package:demo/login.dart';
import 'package:demo/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'SplashPage.dart';

String name,email,imageUrl;
class wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return SplashPage();
          else if (snapshot.data == null) {
            return LoginPage();
          } else {
            name = snapshot.data.displayName;
            email = snapshot.data.email;
            imageUrl = snapshot.data.photoUrl;
            return MyHomePage();
          }
        });
  }
}
