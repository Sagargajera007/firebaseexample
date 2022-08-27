import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class showdata extends StatefulWidget {
  const showdata({Key? key}) : super(key: key);

  @override
  State<showdata> createState() => _showdataState();
}

class _showdataState extends State<showdata> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return status ? (ListView.builder(itemBuilder: (context, index) {

    },)) :  Center(child: Text("No Data Found"));
  }
}
