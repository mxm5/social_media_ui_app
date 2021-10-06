import 'package:flutter/material.dart';
import 'package:social_media_ui_app/constants/fonts.dart';
import 'package:social_media_ui_app/data/data.dart';
import 'package:social_media_ui_app/general_widgets/custom_drawer.dart';
import 'package:social_media_ui_app/general_widgets/profile_clipper.dart';
import 'package:social_media_ui_app/home_screen_widgets/post_carousel.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = '/ProfileScreen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  PageController _pageControllerA ;
  PageController _pageControllerB;

  @override
  void initState() {
    super.initState();
    _pageControllerA = PageController(initialPage: -1, viewportFraction: 0.8);
    //TODO: با گذاشتن این ایندکس ها با آن که نیستند ولی انیمیشن را کال میکنند که باعث تغییر هایت ها میشود
//    _pageControllerA.animateTo(2, duration: Duration(seconds: 1), curve: Curves.easeInOut);
    _pageControllerB = PageController(initialPage: 15, viewportFraction: 0.8);

  }

  @override
  Widget build(BuildContext context) {
//    _pageControllerA.jumpToPage(9);

    return Scaffold(
      key: _key,
      drawer: CustomDrawer(),
      body: ListView(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ClipPath(
                clipper: ProfileClipper(),
                child: Image(
                  width: double.infinity,
                  height: 300,
                  image: AssetImage(currentUser.backgroundImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 10,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(offset: Offset(0, 0), blurRadius: 2)
                  ]),
                  child: ClipOval(
                      child: Image(
                    image: AssetImage(currentUser.profileImageUrl),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0), blurRadius: 30, spreadRadius: 6)
                  ]),
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.white,
                    ),
                  onPressed: ()=>_key.currentState.openDrawer(),

//                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
          Text(currentUser.name,textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('دنبال کنندگان'),
                  Text(stringPersianNumberOf(currentUser.followers.toString(),),),
                ],
              ),
              Column(
                children: <Widget>[
                  Text('دنبال میکنید'),
                  Text(stringPersianNumberOf(currentUser.following.toString(),),),
                ],
              ),
            ],
          ),
          SizedBox(height: 10,width: double.infinity,),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('پست های من ',textAlign: TextAlign.right,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
          ),
          PostCarousel(pageController: _pageControllerA,),
          Padding(
            padding:  EdgeInsets.all(10.0),
            child: Text('مورد علاقه ها',textAlign: TextAlign.right,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
          ),
          PostCarousel(pageController: _pageControllerB,),
        ],

      ),
    );
  }
}
