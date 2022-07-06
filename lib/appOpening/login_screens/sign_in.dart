import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:user_profile_shared_preferences_example/constants/colors.dart';
import 'package:user_profile_shared_preferences_example/navigationBarPages/first_page.dart';

import 'forget_password.dart';
class Sign_in extends StatefulWidget {
  @override
  State<Sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<Sign_in> {
  final emailControler=TextEditingController();
  final passwordControler=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  @override
  void UserLogin({
    required String email,
    required String password,
  }) {
    if (_formKey.currentState!.validate()) {
      FirebaseAuth.instance.signInWithEmailAndPassword
        (email: email, password: password).then((value) {
        print('created new account');
      } );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomNavBar()))
          .onError((error, stackTrace) => 'error is ${error.toString()}');
    }}
  bool hide = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: backgrouColor,
        body: Form(
          child: ListView(
              key: _formKey,
              children: <Widget>[
                Container(
                  height: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png', width: 148, height: 148,),
                      Positioned(
                        bottom: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Med', style: TextStyle(color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),),

                            Text('Life', style: TextStyle(color: Colors.pink[700],
                                fontSize: 24,
                                fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 19,
                        child: Text('Make your health better',
                          style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,),),
                      ),


                    ],),
                ),
                SizedBox(height: 50,),
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      validator: (value){
                        if (value!.isEmpty)
                        {
                          return('Email is empty');
                        }
                      },
                      controller: emailControler,
                      //obscureText: true,
                      style: TextStyle(color: Colors.white),
                      cursorColor: KMainColor,
                      cursorHeight: 25,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined,
                            color: KMainColor,),
                          labelText: 'Email adress',
                          labelStyle: TextStyle(
                              color: KMainColor),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: KMainColor,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: KMainColor,),
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                    )
                ),
                SizedBox(height: 5,),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      validator: (value){
                        if (value!.isEmpty)
                        {
                          return('password should be more than 6 letters');
                        }
                      },
                      controller: passwordControler,
                      obscureText: hide,
                      style: TextStyle(color: Colors.white),
                      cursorColor: KMainColor,
                      cursorHeight: 25,
                      decoration: InputDecoration(

                          suffixIcon: IconButton(onPressed: () {
                            setState(() {
                              hide = !hide;
                            });
                          },
                            icon: hide
                                ? Icon(Icons.visibility_off_outlined)
                                : Icon(Icons.visibility_outlined),
                            color: KMainColor,),
                          prefixIcon: Icon(Icons.password,
                            color: KMainColor,),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: KMainColor
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: KMainColor,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: KMainColor,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          )),)
                ),
                Align(alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                      }, child: Text('Forget password?',
                      style: TextStyle(color: KMainColor),),),
                  ),),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Container(
                    //width: double.infinity,
                    child: SizedBox(
                      width: 30,
                      height: 56,
                      child: MaterialButton(
                        onPressed:()=>{
                          UserLogin(email: emailControler.text, password: passwordControler.text)
                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavBar()))
                        },
                        /**  FirebaseAuth.instance.signInWithEmailAndPassword
                            (email: emailControler.text, password: passwordControler.text).then((value) {
                            print('created new account');
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()))
                            .onError((error, stackTrace) => 'error is ${error.toString()}');});
                            if( _formKey.currentState!.validate()){
                            }},**/
                        color: Colors.pink[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),),
                        child: Text('Login',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),
                      ),),),),
                SizedBox(height: 15,),
              ]
          ),
        )

    );
  }
}



