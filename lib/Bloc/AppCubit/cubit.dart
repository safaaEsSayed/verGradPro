//import 'dart:ffi';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:user_profile_shared_preferences_example/Bloc/AppStates/states.dart';
//import 'package:user_profile_shared_preferences_example/page/edit_profile_page.dart';

import '../../model/User_Model/user_model.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(InitialState());


  static AppCubit get(context) => BlocProvider.of(context);
  UserModel ?userModel;


  void uploadProfile({

    String? name,
    String? about,
    String? email,
    String? imagePath,
    String? uId,
    String? age,
    String? phoneNumber,


  }){

    UserModel userModel= UserModel(
        fullName: name,
        bio: about,
        email: email,
        uId: uId,
        image: imagePath,
        age: age,
        phoneNumber: phoneNumber
    );

    FirebaseFirestore.instance.collection('test').doc('1').set(
        userModel.toMap()
    ).then((value) {
      print('Upload Success');
      emit(UploadProfileSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(UploadProfileErrorState());

    });
  }

  Future<void> getProfile(context) async{

      FirebaseFirestore.instance.collection('test').doc('1').get().then((value) {

        userModel=UserModel.formJson(value.data()!);

        print('Get Success');
        print(userModel!.phoneNumber);

        emit(GetProfileSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(GetProfileErrorState());
      });
  }


  File? profileImage;

  ImageProvider profile = const AssetImage('assets/images/profile.png');

  var picker = ImagePicker();
  File ?newImage;
  File ?imageFile;
  Future<void> getProfileImage() async {
    final image = await ImagePicker()
        .getImage(source: ImageSource.gallery);

    if (image == null) return;

    final directory = await getApplicationDocumentsDirectory();
    final name = basename(image.path);
    imageFile = File('${directory.path}/$name');
    newImage =
    await File(image.path).copy(imageFile!.path);
    emit(UploadProfileSuccessState());

  }

  String ?imageValue;

  Future uploadUserImage(){

    return firebase_storage.FirebaseStorage.instance.ref()
        .child('users/${Uri.file(imageFile!.path).pathSegments.last}')
        .putFile(imageFile!).then((value) {

      value.ref.getDownloadURL().then((value) {

        print('Upload Success');
        print(value);
        imageValue=value;

        emit(UploadProfileImageSuccessState());

      }).catchError((error){

        print('Error in Upload profileImage ${error.toString()}');
        emit(UploadUserProfileImageErrorState());

      });

    }).catchError((error){

      print('Error in Upload profileImage ${error.toString()}');
      emit(UploadUserProfileImageErrorState());
    });


  }

  List userDiseases =[];

  void uploadUserDiseases(){

    FirebaseFirestore.instance.collection('userDiseases').add(
        {
          'Diseases': userDiseases.toList()
        }
     ).then((value) {
      print(value);
      emit( UploadDiseasesSuccessState());
    }).catchError((error){
      print ('Error is ${error.toString()}');
      emit( UploadDiseasesErrorState());
    });

  }

  List getDiseases=[] ;

  void getUserDiseases(){


    FirebaseFirestore.instance
        .collection('userDiseases').doc('2DnzlDTaYfMqrUX5vQKq')
        .get().then((value) {

      getDiseases=value.data()!.values.toList();

      print(getDiseases.length);
      print('sssssssssssssssssssssssssssssssssssssss');
      print(getDiseases[0].toString().length);
      print('sssssssssssssssssssssssssssssssssssssss');

      emit(GetDiseasesSuccessState());


    }).catchError((error){

      print('Error is ${error.toString()}');
      emit(GetDiseasesErrorState());


    });


  }


}