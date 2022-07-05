import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_profile_shared_preferences_example/Bloc/AppCubit/cubit.dart';
import 'package:user_profile_shared_preferences_example/Bloc/AppStates/states.dart';
import 'package:user_profile_shared_preferences_example/model/User_Model/user_model.dart';
import 'package:user_profile_shared_preferences_example/model/user.dart';
import 'package:user_profile_shared_preferences_example/page/edit_profile_page.dart';
import 'package:user_profile_shared_preferences_example/utils/user_preferences.dart';
import 'package:user_profile_shared_preferences_example/widget/appbar_widget.dart';

import 'package:user_profile_shared_preferences_example/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();


    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

      },
      builder: (context,state){
        return ThemeSwitchingArea(

          child: Builder(

              builder: (context) {

                return Scaffold(
            appBar: buildAppBar(context),
            backgroundColor: Color(0xFF100F1E),
            body:
                 ListView(
              physics: BouncingScrollPhysics(),
              children: [
                  ProfileWidget(
                    imagePath: (user.imagePath)!,
                    onClicked: ()  {

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
                        return EditProfilePage(title: 'kk');
                      }));

                    },
                  ),
                  const SizedBox(height: 24),
                  buildName(user),
                  const SizedBox(height: 24),
                  buildAge(user),
                  const SizedBox(height: 24),
                  buildPhoneNumber(user),
                  const SizedBox(height: 25),
                  buildAbout(user),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(left: 45),
                    child: Text('Diseases :',style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                SizedBox(height: 20,),
                Container(
                    height: 200,
                    child: ListView.separated(
                        itemBuilder: (context,index){
                          return Container(
                            child: Column(
                              children: [
                                Text(AppCubit.get(context).getDiseases[0][index],style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                ),),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context,index){
                          return SizedBox(height: 5,);
                        },
                        itemCount: AppCubit.get(context).getDiseases[0].length
                    ),
                  )

              ],
            ),
          ) ;
              },
          ),
        );
      },

    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            AppCubit.get(context).userModel!.fullName!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            AppCubit.get(context).userModel!.email!,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 4),
        ],
      );

  Widget buildAge(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Age',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              AppCubit.get(context).userModel!.age!,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );

  Widget buildPhoneNumber(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PhoneNumber',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              AppCubit.get(context).userModel!.phoneNumber!,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              AppCubit.get(context).userModel!.bio!,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
