
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_profile_shared_preferences_example/constants/colors.dart';
import 'package:user_profile_shared_preferences_example/appOpening//login_screens/sign_in.dart';
import 'package:user_profile_shared_preferences_example/appOpening/login_screens/sign_up.dart';

class Login extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrouColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/login.png',
              height: 350,
              width: 400,),
            SizedBox(height: 15,),
            Text('Make your health better',
              style: TextStyle(
                fontSize: 25,
                color: KMainColor,
              ),),
            SizedBox(height: 12,),
            Container(
              //width: double.infinity,
              child:  SizedBox(
                width: 325,
                height: 56,
                child: MaterialButton(
                  onPressed:()=>{
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_in()))
                  },
                  color:KMainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),),
                  child: Text('Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
                ),),
            ),
            SizedBox(height: 15,),
            SizedBox(
              width: 325,
              height: 56,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                },
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.all(Radius.circular(25)),),
                child: Text('Create An Acount',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
