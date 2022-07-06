
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_profile_shared_preferences_example/appOpening/login_screens/sign_in.dart';
import 'package:user_profile_shared_preferences_example/constants/colors.dart';
import 'package:user_profile_shared_preferences_example/navigationBarPages/first_page.dart';

class SignUp extends StatefulWidget {


  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool hide = true;
  final _globalKey=GlobalKey<FormState>();
  TextEditingController emailControler=TextEditingController();
  TextEditingController passwordControler=TextEditingController();
  TextEditingController nameControler=TextEditingController();
  TextEditingController phoneControler=TextEditingController();

  void UserRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    if (_globalKey.currentState!.validate()) {
      FirebaseAuth.instance.createUserWithEmailAndPassword
        (email: email, password: password).then((value) {
        print('created new account');
      } );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Sign_in()))
          . onError((error, stackTrace) =>'error is ${error.toString()}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgrouColor,
        body: Form(
          key: _globalKey,
          child: ListView(
              children: <Widget>[
                Container(
                  height: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png', width: 148, height: 148,),
                      Positioned(
                        bottom: 30,
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
                      ),],),),
                SizedBox(height: 20,),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      validator: (value){
                        if (value!.isEmpty)
                        {
                          return('name is empty');
                        }
                      },
                      //obscureText: true,
                      style: TextStyle(color: Colors.white),
                      cursorColor: KMainColor,
                      cursorHeight: 25,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.drive_file_rename_outline,
                            color: KMainColor,),
                          labelText: 'Your Name',
                          labelStyle: TextStyle(
                              color: KMainColor),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: KMainColor,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
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
                SizedBox(height: 20,),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
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
                          border: OutlineInputBorder(
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
                SizedBox(height: 20,),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      validator: (value){
                        if (value!.isEmpty)
                        {
                          return('Password is empty');
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
                            });},
                            icon: hide
                                ? Icon(Icons.visibility_off_outlined)
                                : Icon(Icons.visibility_outlined),
                            color: KMainColor,),
                          prefixIcon: Icon(Icons.password,
                            color: KMainColor,),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: KMainColor),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: KMainColor,),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: KMainColor,),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: KMainColor,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          )),)),
                SizedBox(height: 20,),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      validator: (value){
                        if (value!.isEmpty)
                        {
                          return('phone is empty');
                        }
                      },

                      style: TextStyle(color: Colors.white),
                      cursorColor: KMainColor,
                      cursorHeight: 25,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone,
                            color: KMainColor,),
                          labelText: 'Phone',
                          labelStyle: TextStyle(
                              color: KMainColor),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: KMainColor,),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: KMainColor,),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: KMainColor,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          )),)),
                SizedBox(height: 35,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Container(
                    child: SizedBox(
                      height: 54,
                      child: Builder(
                          builder: (context) {
                            return MaterialButton(
                              onPressed:(){
                              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavBar()));
                                UserRegister(
                                  name: nameControler.text,
                                  email: emailControler.text,
                                  password: passwordControler.text,
                                  phone: phoneControler.text)
                              ;
                              },

                              color: KMainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25)),),
                              child: Text('Sign Up',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),),
                            );
                          }
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Sign_in()));
                  },
                  child: Center(
                    child: Text('Already have an acount?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),),

                  ),
                ) ]),
        ));
  }}
