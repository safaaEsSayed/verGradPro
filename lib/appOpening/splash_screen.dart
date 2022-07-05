import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_profile_shared_preferences_example/constants/colors.dart';

import 'login_screens/login.dart';


class Splash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasySplashScreen(
        backgroundColor:backgrouColor ,
        logo: Image.asset('assets/images/logo.png'),
        logoSize: 400,
        title: Text('MedLife',style: TextStyle(color: KMainColor,fontSize: 25),),
         navigator: Login(),
        showLoader: true,
        loadingText: Text("Loading..."),
        durationInSeconds: 7,
      ),

    );
  }
}
