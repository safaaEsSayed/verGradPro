import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_profile_shared_preferences_example/Bloc/AppCubit/cubit.dart';
import 'package:user_profile_shared_preferences_example/Bloc/AppStates/states.dart';
import 'package:user_profile_shared_preferences_example/page/edit_profile_page.dart';
import 'package:user_profile_shared_preferences_example/page/profile_page.dart';
import 'package:user_profile_shared_preferences_example/themes.dart';
import 'package:user_profile_shared_preferences_example/utils/user_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await UserPreferences.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return BlocProvider(

      create: (BuildContext context) =>AppCubit()..getProfile(context)..getUserDiseases(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){

        },
        builder: (context,state){
          return ThemeProvider(
            initTheme: user.isDarkMode! ? MyThemes.darkTheme : MyThemes.lightTheme,
            child: Builder(
              builder: (context) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: title,
                  home: ProfilePage()
              ),
            ),
          );
        },
      ),
    );
  }
}
