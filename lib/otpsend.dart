import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class otpsend extends StatefulWidget {
  const otpsend({Key? key}) : super(key: key);

  @override
  State<otpsend> createState() => _otpsendState();
}

class _otpsendState extends State<otpsend> {
  TextEditingController tnumber = TextEditingController();
  OtpFieldController tcode = OtpFieldController();

  String mverificationId="";
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("OTP"),
      ),
      body: Column(
        children: [
          TextField(
            controller: tnumber,
          ),
          ElevatedButton(onPressed: () async {
            String phoneno = tnumber.text;

            await FirebaseAuth.instance.verifyPhoneNumber(
              phoneNumber: '+91$phoneno',

              verificationCompleted: (PhoneAuthCredential credential) {},
              verificationFailed: (FirebaseAuthException e) {},
              codeSent: (String verificationId, int? resendToken) {
                mverificationId = verificationId;
              },
              codeAutoRetrievalTimeout: (String verificationId) {},
            );

          }, child: Text("send otp")),
          // TextField(
          //   controller: tcode,
          // ),
          OTPTextField(controller: tcode,
              length: 6,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 45,
              fieldStyle: FieldStyle.box,
              outlineBorderRadius: 15,
              style: TextStyle(fontSize: 17),
              onChanged: (pin) {
                print("Changed: " + pin);
              }, onCompleted: (pin) {
                print("Completed: " + pin);
              }),
          ElevatedButton(onPressed: () async {

            String smsCode = tcode.toString();

            PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: mverificationId, smsCode: smsCode);

            // Sign the user in (or link) with the credential
            await auth.signInWithCredential(credential).then((value){
              print(value);
              String? number = value.user!.phoneNumber;
            }
            );

          }, child: Text("Verify otp"))
        ],
      ),
    );

  }
}
