
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgrouColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/pharmacy.png',
              width: double.infinity,
              height: 220,),
            Container(
              child: Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: AutoSizeText(
                    'An easy way to know the nearest pharmacy of you, to get your medicine',
                    style: Theme.of(context)
                        .textTheme
                        .headline5

                        ?.copyWith(color: Colors.grey[600], height: 1.3,),
                    textAlign: TextAlign.center,
                    maxLines: 4,
                  )),
            ),
            SizedBox(height: 20,),
            Container(
              width: 380,
              child: MaterialButton(
                  onPressed: () async{
                    final url = 'https://www.google.co.uk/maps/search/pharmacy/@26.7828843,31.2627057,12.4z?hl=en';
                    if (await canLaunch(url)){
                      await launch(url);};},
                  color: KMainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),),
                  child: Text('Nearest pharmacy',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: Colors.white, height: 1.3,),)),

            )

          ],
        )
    );
  }
}
