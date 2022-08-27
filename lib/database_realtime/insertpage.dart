import 'package:firebase_database/firebase_database.dart';
import 'package:firebaseexample/database_realtime/showdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class insertpage extends StatefulWidget {
  const insertpage({Key? key}) : super(key: key);

  @override
  State<insertpage> createState() => _insertpageState();
}

class _insertpageState extends State<insertpage> {
  TextEditingController tname = TextEditingController();
  TextEditingController tnumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insert Page"),
        leading: IconButton(onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return showdata();
            },));
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          TextField(
            controller: tname,
          ),
          TextField(
            controller: tnumber,
          ),
          ElevatedButton(onPressed: () {
            FirebaseDatabase database = FirebaseDatabase.instance;

            DatabaseReference ref = database.ref("Contactbook").push();

            String? userid = ref.key;

            String name = tname.text;
            String number = tnumber.text;

            Map m = {"userid" : userid,"name" : name,"number" : number};

            ref.set(m);
            print(m);

          }, child: Text("Insert"))
        ],
      ),
    );
  }
}
