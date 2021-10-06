import 'package:flutter/material.dart';
import 'package:social_media_ui_app/constants/fonts.dart';
import 'package:social_media_ui_app/screen/home_screen.dart';
import 'package:social_media_ui_app/screen/login_screen.dart';
import 'package:social_media_ui_app/screen/profile_screen.dart';
import 'package:social_media_ui_app/screen/show_fonts.dart';
import 'package:social_media_ui_app/screen/story_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social media app ui',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(fontFamily: kF_Vazir,),
        primaryColor: Colors.teal,

accentColor: Colors.tealAccent

//accentColor: Colors.purpleAccent
//        primarySwatch: Colors.red,
      ),
      initialRoute: LoginScreen.id,
      routes: {
        ShowFonts.id: (context) => ShowFonts(),
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ProfileScreen.id:(context)=> ProfileScreen(),
        StoryScreen.id:(context)=> StoryScreen(),
      },
    );
  }
}
