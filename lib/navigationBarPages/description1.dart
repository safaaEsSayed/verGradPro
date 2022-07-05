import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class description extends StatelessWidget {

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
                          'https://images.emedicinehealth.com/images/article/main_image/bacterial-pneumonia-1.jpg',
                        ),
                      ),
                        Positioned(
                            bottom: 0,
                            child: Text('Pneumonia',style: TextStyle(color: KMainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),))

                      ])),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Text("-  Cereals rich with carbohydrates and vitamin B,such as (Quinoa - brown rice - oats)These provide the body with energy and maintainbody temperature, which increases the speed ofrecovery from pneumonia.",
                  style: TextStyle(color: Colors.white,
                    fontSize: 16,),),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Text("-  Protein-rich foods (such as nuts, seeds, beans, and white meat) and cold-water fish haveanti-inflammatory properties and repair damagedtissues and build new ones in the body. ",
                  style: TextStyle(color: Colors.white,
                    fontSize: 16,),),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Text("-  Leafy green vegetables (kale, lettuce, and spinach) speed up recovery from lung infection because they are an excellent source of antioxidants, which protect the body from infectious agents.  ",
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
                child: Text("-  Yogurt: The probiotics in yogurt can prevent the growth of pneumonia pathogens as well as boost your immune system, by increasing the good bacteria in your gut. ",
                  style: TextStyle(color: Colors.white,
                    fontSize: 16,),),
              ),
            ])


    );


  }
}