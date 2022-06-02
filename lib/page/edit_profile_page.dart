import 'dart:io';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:user_profile_shared_preferences_example/Bloc/AppCubit/cubit.dart';
import 'package:user_profile_shared_preferences_example/Bloc/AppStates/states.dart';
import 'package:user_profile_shared_preferences_example/model/User_Model/user_model.dart';
import 'package:user_profile_shared_preferences_example/model/user.dart';
import 'package:user_profile_shared_preferences_example/utils/user_preferences.dart';
import 'package:user_profile_shared_preferences_example/widget/appbar_widget.dart';
import 'package:user_profile_shared_preferences_example/widget/button_widget.dart';
import 'package:user_profile_shared_preferences_example/widget/profile_widget.dart';
import 'package:user_profile_shared_preferences_example/widget/textfield_widget.dart';
import 'package:path/path.dart';
import 'package:user_profile_shared_preferences_example/model/notification_setting.dart';

class EditProfilePage extends StatefulWidget {
  final String title;
  const EditProfilePage({
    required this.title,
  });
  @override
  _EditProfilePageState createState() => _EditProfilePageState();

}

class _EditProfilePageState extends State<EditProfilePage> {

  late User user;

  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }
  final allDiseases = Diseases(title: 'All Diseases');

  final diseases = [
    Diseases(title: 'Diabetes Mellitus'),
    Diseases(title: 'Asthma'),
    Diseases(title: 'CADASIL'),
    Diseases(title: 'Breast Neoplasms'),
    Diseases(title: 'Diabetes Mellitus'),
    Diseases(title: 'Paraplegia'),
    Diseases(title: 'Rodrigues Blindness'),
    Diseases(title: 'Hypertension, Diastolic, Resistance To'),
    Diseases(title: 'Renal Failure, Progressive, With Hypertension'),
    Diseases(title: 'Hyperthermia, Cutaneous, With Headaches And Nausea'),
    Diseases(title: 'Insensitivity To Pain With Hyperplastic Myelinopathy'),
    Diseases(title: 'Migraine With Or Without Aura, Susceptibility To, 1'),
  ];

  @override
  Widget build(BuildContext context) =>BlocConsumer<AppCubit,AppStates>(
    listener: (context,state){},
    builder: (context,state){

      return ThemeSwitchingArea(

      child: Scaffold(
        backgroundColor: Colors.white,
        body: Builder(
          builder: (context) => Scaffold(
            appBar: buildAppBar(context),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: (user.imagePath)! ,
                  isEdit: true,
                  onClicked: () async {
                    final image = await ImagePicker()
                        .getImage(source: ImageSource.gallery);

                    if (image == null) return;

                    final directory = await getApplicationDocumentsDirectory();
                    final name = basename(image.path);
                    final imageFile = File('${directory.path}/$name');
                    final newImage =
                    await File(image.path).copy(imageFile.path);
                    // AppCubit.get(context).getProfileImage();

                    setState(() => user = user.copy(imagePath:newImage.path));
                  },
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Full Name',
                  text: AppCubit.get(context).userModel!.fullName!,
                  onChanged: (name) => user = user.copy(name: name),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Age',
                  text:  AppCubit.get(context).userModel!.age!,
                  onChanged: (age) => user = user.copy(age: age),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Phone Number',
                  text:  AppCubit.get(context).userModel!.phoneNumber!,
                  onChanged: (phoneNumber) => user = user.copy(phoneNumber: phoneNumber),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text:  AppCubit.get(context).userModel!.email!,
                  onChanged: (email) => user = user.copy(email: email),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'About',
                  text:  AppCubit.get(context).userModel!.bio!,
                  maxLines: 5,
                  onChanged: (about) => user = user.copy(about: about),
                ),
                const SizedBox(height: 24),
                buildToggleCheckbox(allDiseases),
                Divider(),
                Container(
                  height: MediaQuery.of(context).size.height*.5,

                  child: ListView.separated(
                    itemCount: diseases.length,
                    itemBuilder: (context,index){
                      // print(diseases[index].value);
                      // if(diseases[index].value==true){
                      //   AppCubit.get(context).userDiseases.add(diseases[index].title);
                      // }
                      // print(AppCubit.get(context).userDiseases);
                      return buildSingleCheckbox(diseases[index]);
                    },
                    separatorBuilder: (context,index){
                      return SizedBox(height: 10,);
                    },
                  ),
                ),
                 SizedBox(height: 10,),
                ButtonWidget(
                  text: 'Save',
                  onClicked: () {
                    UserPreferences.setUser(user);
                    AppCubit.get(context).getProfile(context).then((value) {
                      Navigator.of(context).pop();
                    });
                    print(user.email);
                    AppCubit.get(context).userDiseases=[];
                    diseases.map((e) {
                      if(e.value==false || AppCubit.get(context).userDiseases.contains(e.title)){
                        // print(e.value);
                        // print(e.title);
                      }
                      else{
                        print(e.value);
                        print(e.title);
                        AppCubit.get(context).userDiseases.add(e.title);
                      }

                    }).toList();
                     print(AppCubit.get(context).userDiseases);

                    AppCubit.get(context).uploadProfile(
                        name: user.name,
                        age: user.age,
                        phoneNumber: user.phoneNumber,
                        email: user.email,
                        about: user.about,
                        uId:  user.imagePath,
                        imagePath: user.imagePath
                    );
                    AppCubit.get(context).uploadUserDiseases();

                    // AppCubit.get(context).uploadUserImage().then((value) {
                    //
                    // });

                  },
                ),
              ],
            ),
          ),

        ),
      ),
    );
    },
  );
  Widget buildToggleCheckbox(Diseases disease) => buildCheckbox(
      disease: disease,
      onClicked: () {
        final newValue = !disease.value;

        setState(() {
          allDiseases.value = newValue;
          diseases.forEach((notification) {
            notification.value = newValue;
          });
        });
      });

  Widget buildSingleCheckbox(Diseases disease) => buildCheckbox(
    disease: disease,
    onClicked: () {
      setState(() {
        final newValue = !disease.value;
        disease.value = newValue;

        if (!newValue) {
          allDiseases.value = false;
        } else {
          final allow =
          diseases.every((disease) => disease.value);
          allDiseases.value = allow;
        }
      });
    },
  );

  Widget buildCheckbox({
    required Diseases disease,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        onTap: onClicked,
        leading: Checkbox(
          value: disease.value,
          onChanged: (value) => onClicked(),
        ),
        title: Text(
          disease.title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      );
}

