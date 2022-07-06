//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//import 'package:user_profile_shared_preferences_example/constants/colors.dart';


class ForgotPassword extends StatefulWidget {
  static String id = 'forgot-password';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailControler=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter Your Email',
                style: TextStyle(fontSize: 25, color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25,),
              TextFormField(
                controller: emailControler,
                validator: (value){
                  if (value!.isEmpty)
                  {
                    return('Email is empty');
                  }
                },

                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                cursorHeight: 25,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined,
                      color: Colors.white,),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,),
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Container(
                  width: double.infinity,
                  child: SizedBox(
                    height: 60,
                    child: MaterialButton(
                      onPressed: () {
                        ResetPassword(context);
                      },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),),
                      child: Text('Send Email',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                  ),
                ),
              ),

              FlatButton(
                child: Text('Sign In',
                  style: TextStyle(color: Colors.white),),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
  void ResetPassword(BuildContext context) async{
    if(emailControler.text.length==0||emailControler.text.contains("0")){
      Fluttertoast.showToast(
          msg: "Enter valid Email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return;
    }
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailControler.text);
    Fluttertoast.showToast(msg: "Reset password link has sent to your email please use it to change the password");
    Navigator.pop(context);

  }
}