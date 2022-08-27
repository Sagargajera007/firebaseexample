import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseexample/database_realtime/insertpage.dart';
import 'package:firebaseexample/googlelogin.dart';
import 'package:firebaseexample/otpsend.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(MaterialApp(home:insertpage(),debugShowCheckedModeBanner: true,));
}

