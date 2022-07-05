
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: backgrouColor,
      body:ListView(
          children:[
            Padding(
              //
              padding: const EdgeInsets.only(top: 40.0),
              child: CarouselSlider(
                  items: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20), image: DecorationImage(image: AssetImage('assets/images/1.jpg'), fit: BoxFit.cover,)),),
                        Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.pink.withOpacity(.3),),)],),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(image: AssetImage('assets/images/2.jpg'), fit: BoxFit.cover,)),),
                        Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.pink.withOpacity(.3),),)],),
                    Stack(
                      children: [Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage('assets/images/3.jpg'),
                              fit: BoxFit.cover,
                            )),
                      ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.pink.withOpacity(.3),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage('assets/images/4.jpg'),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.pink.withOpacity(.3),
                          ),
                        )
                      ],
                    ),
                  ],
                  options: CarouselOptions(
                    height: 170,
                    aspectRatio: 16 / 9,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: .8,
                  )),
            ),
            SizedBox(height: 40,),
            Container(
                child: Padding(
                  padding: const EdgeInsets.only(top:20.0,bottom: 20, left: 20, right: 20),
                  child: TextFormField(
                      maxLines: 7,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.pink.withOpacity(0.3),

                        filled: true,
                        hintText: "Enter Drug Name",
                        hintStyle: TextStyle(
                            color: Colors.white
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            // color: Colors.pink,

                          ),),)),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90.0),
              child: Container(

                width: 50,
                height: 50,
                child: MaterialButton(onPressed: (){},
                    color: KMainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),),
                    child: Text('Result',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,))),
              ),
            )
          ]

      ),

    );
  }
}

