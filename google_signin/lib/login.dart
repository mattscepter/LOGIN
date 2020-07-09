import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}
class _LoginPage extends State<Login> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Center(
          child: FlatButton(onPressed: () async {
            // Validate will return true if is valid, or false if invalid.
                FirebaseUser result =
                    await Provider.of<Authprovider>(context).handleSignIn();
                print(result);
          },
          child: Text("SignIn With Google")
          ),
        ),
      ),
    );
  }

}