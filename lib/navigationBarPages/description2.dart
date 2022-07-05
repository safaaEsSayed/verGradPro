import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class description2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgrouColor,
        body:ListView(
            children:[
              Container(
                  height: 170,
                  child:Stack(
                      alignment: Alignment.center,
                      children:[ CircleAvatar(
                        radius: 60.0,
                        backgroundImage: NetworkImage(
                          'https://keyfpro.com/wp-content/uploads/2021/04/%D8%A3%D8%B9%D8%B1%D8%A7%D8%B6-%D8%A7%D9%84%D8%B3%D9%83%D8%B1%D9%8A-%D9%81%D9%8A-%D8%A8%D8%AF%D8%A7%D9%8A%D8%AA%D9%87-%D9%88%D8%B7%D8%B1%D9%82-%D8%A7%D9%84%D9%88%D9%82%D8%A7%D9%8A%D8%A9-%D9%85%D9%86%D9%87.jpeg',
                        ),
                      ),
                        Positioned(
                            bottom: 0,
                            child: Text('diabetes',style: TextStyle(color: KMainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),))

                      ])),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Text("-vegetables:- nonstarchy: includes broccoli, carrots, greens, peppers, and tomatoes starchy: includes potatoes, corn, and green peas",
                  style: TextStyle(color: Colors.white,
                    fontSize: 16,),),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Text("-fruits:  includes oranges, melon, berries, apples, bananas, and grapes",
                  style: TextStyle(color: Colors.white,
                    fontSize: 16,),),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Text("-grains 'at least half of your grains for the day should be whole grains' includes wheat, rice, oats, cornmeal, barley, and quinoa examples: bread, pasta, cereal, and tortillas",
                  style: TextStyle(color: Colors.white,
                    fontSize: 16,),),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Text("-  Citrus fruits (such as oranges, berries, and kiwis) help boost your immune system, thus making aquick recovery from pneumonia.",
                  style: TextStyle(color: Colors.white,
                    fontSize: 16,),),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Text("- protein( -lean meat     -chicken or turkey without the skin   -fish   -eggs   -nuts and peanuts     -dried beans and certain peas, such as chickpeas and split peas   -meat substitutes, such as tofu)",
                  style: TextStyle(color: Colors.white,
                    fontSize: 16,),),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Text("- dairy—nonfat or low fat 'milk or lactose-free milk if you have lactose intolerance -yogurt -cheese'",
                  style: TextStyle(color: Colors.white,
                    fontSize: 16,),),)
            ])


    );
  }
}

