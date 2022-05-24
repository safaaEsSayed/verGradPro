import 'dart:io';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:user_profile_shared_preferences_example/model/user.dart';
import 'package:user_profile_shared_preferences_example/utils/user_preferences.dart';
import 'package:user_profile_shared_preferences_example/widget/appbar_widget.dart';
import 'package:user_profile_shared_preferences_example/widget/button_widget.dart';
import 'package:user_profile_shared_preferences_example/widget/profile_widget.dart';
import 'package:user_profile_shared_preferences_example/widget/textfield_widget.dart';
import 'package:path/path.dart';
import 'package:grouped_checkbox/grouped_checkbox.dart';
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
    Diseases(title: 'Hypertension'),
    Diseases(title: 'Diastolic'),
    Diseases(title: 'Progressive'),
    Diseases(title: 'Cutaneous'),
  ];

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(

        child: Builder(
          builder: (context) => Scaffold(
            appBar: buildAppBar(context),
            backgroundColor: Color(0xFF100F1E),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: user.imagePath,
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

                    setState(() => user = user.copy(imagePath: newImage.path));
                  },
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Full Name',
                  text: user.name,
                  onChanged: (name) => user = user.copy(name: name),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Age',
                  text: user.age,
                  onChanged: (age) => user = user.copy(age: age),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Phone Number',
                  text: user.phoneNumber,
                  onChanged: (phoneNumber) => user = user.copy(phoneNumber: phoneNumber),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text: user.email,
                  onChanged: (email) => user = user.copy(email: email),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'About',
                  text: user.about,
                  maxLines: 5,
                  onChanged: (about) => user = user.copy(about: about),
                ),
                const SizedBox(height: 24),
                buildToggleCheckbox(allDiseases),
                Divider(),
                ...diseases.map(buildSingleCheckbox).toList(),

                ButtonWidget(
                  text: 'Save',
                  onClicked: () {
                    UserPreferences.setUser(user);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),

        ),
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

