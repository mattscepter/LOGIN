import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';


final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

class Authprovider with ChangeNotifier{

  Future<FirebaseUser> handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    print("signed in ");
    notifyListeners();
    return user;
  }


  Future<void> signOutGoogle() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signOut();
    notifyListeners();
    print("signOutWithGoogle succeeded");

  }

  Future getCurrentUser() async {
    FirebaseUser _user = await _auth.currentUser();
    //print("User: ${_user.displayName ?? "None"}");
    return _user;
  }
}

