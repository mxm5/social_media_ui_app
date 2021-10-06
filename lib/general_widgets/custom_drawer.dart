import 'package:flutter/material.dart';
import 'package:social_media_ui_app/screen/home_screen.dart';
import 'package:social_media_ui_app/screen/login_screen.dart';
import 'package:social_media_ui_app/screen/profile_screen.dart';

import 'build_drawer_top.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          BuildDrawerTop(),
          MeListyle(
            tex: 'برگشتن به خانه',
            onPress: () {
//              if (Navigator.defaultRouteName == HomeScreen.id
//              ) {
//                Navigator.pushNamed(context, HomeScreen.id);
//              }
//              else {
                Navigator.pushReplacementNamed(context, HomeScreen.id,);
                print(Navigator.defaultRouteName == HomeScreen.id);
//              }
            },
            icon: Icon(Icons.dashboard),
          ),
          MeListyle(
            tex: 'چت ها ',
            onPress: () {},
            icon: Icon(Icons.chat),
          ),
          MeListyle(
            tex: 'رفتن به پروفایل ',
            onPress: () {
              Navigator.pushReplacementNamed(context, ProfileScreen.id);
            },
            icon: Icon(Icons.account_box),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: MeListyle(
                  tex: 'خروج از حساب کاربری',
                  onPress: () {
                    Navigator.pushReplacementNamed(context, LoginScreen.id);
                  },
                  icon: Icon(Icons.directions_run),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MeListyle extends StatelessWidget {
  final String tex;
  final Icon icon;
  final Function onPress;

  const MeListyle({this.icon, this.onPress, this.tex});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(tex),
      onTap: onPress,
    );
  }
}
