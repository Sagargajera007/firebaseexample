import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class goolelogin extends StatefulWidget {
  const goolelogin({Key? key}) : super(key: key);

  @override
  State<goolelogin> createState() => _gooleloginState();
}

class _gooleloginState extends State<goolelogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Login with Google"),),
    body: Column(children: [ElevatedButton(onPressed: () {
      signInWithGoogle().then((value) {
        print(value);
      });
    }, child: Text("Login with Google")),
ElevatedButton(onPressed: () async {
    await GoogleSignIn().signOut().then((value) {
    print("Logout");
    });
}, child: Text("Logout"))
    ],),
    );
  }
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

