import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_ui_app/constants/fonts.dart';
import 'package:social_media_ui_app/constants/styles.dart';
import 'package:social_media_ui_app/general_widgets/custom_drawer.dart';
import 'package:social_media_ui_app/home_screen_widgets/post_carousel.dart';
import 'package:social_media_ui_app/home_screen_widgets/friends_list.dart';


class HomeScreen extends StatefulWidget {
  static final String id = '/HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    //TODO: با گذاشتن این ایندکس ها با آن که نیستند ولی انیمیشن را کال میکنند که باعث تغییر هایت ها میشود
    _pageController = PageController(initialPage: -1/* TODO: طلایی*/, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
//    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kPrimaryColor(context),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'دورهمي',
          style: kHeroTS.copyWith(
            fontSize: 30,
            color: kPrimaryColor(context),
          ),
        ),
        brightness: Brightness.light,
        bottom: TabBar(
          controller: _controller,
          labelColor: kPrimaryColor(context),
          labelStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, fontFamily: kF_Vazir),
          unselectedLabelColor: Colors.grey[600],
          unselectedLabelStyle: TextStyle(fontSize: 12, fontFamily: kF_Vazir),
          indicatorColor: kPrimaryColor(context),
          indicatorWeight: 3,
          tabs: <Widget>[
            Tab(
              text: 'آخرین ها',
            ),
            Tab(
              text: 'پرطرفدار ترین ها',
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Text(
                  'فعالیت های اخیر',
                  style: TextStyle(),
                ),
              ),
              FriendsList(),
              PostCarousel(
                pageController: _pageController,
              ),
            ],
          )
        ],
      ),
    );
  }
}


