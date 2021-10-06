import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_ui_app/constants/fonts.dart';
import 'package:social_media_ui_app/constants/styles.dart';
import 'package:social_media_ui_app/screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static final String id = '/';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.lightGreen[200],
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container( height: MediaQuery.of(context).size.height/8,color: kPrimaryColor(context).withOpacity(0.5),),
                  ClipPath(
                    clipper: WavyClipper(),
                    child: Image(
                      image: AssetImage('assets/images/login_background.jpg'),
                      height: MediaQuery.of(context).size.height / 2.59,
                      fit: BoxFit.cover,
                    ),
                  ),

                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.teal.shade300,
                        Colors.teal.shade900
                      ]),
                      borderRadius: BorderRadius.only( bottomLeft: Radius.circular(30))
                    ),
                    child: Center(
                      child: Padding(
                        padding:  EdgeInsets.all(4.0),
                        child: Text(
                          'ساخته شده توسط محمد محمدیان',
                          style: kHeroTS.copyWith(color: Colors.white,fontFamily: kF_Dima_Fantasy,fontSize: 18),
                        ),
                      ),
                    ),
                  ),Text(
                    'دورهمي',
                    style: kHeroTS.apply(color: kPrimaryColor(context)),
                  ),
                ],
              ),
//              Padding(
//                padding: EdgeInsets.all(15.0),
//                child: Column(
//                  children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'نام کاربری',
                      hintStyle: kHintTS,
                      prefixIcon: SizedBox(
                        width: 25,
                      ),
                      alignLabelWithHint: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      suffixIcon: Icon(Icons.account_box)),
//                      textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
//                        obscureText: true,
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'رمز عبور',
                      prefixIcon: SizedBox(
                        width: 25,
                      ),
                      hintStyle: kHintTS,
                      alignLabelWithHint: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      suffixIcon: Icon(Icons.lock)),
//                      textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  obscureText: true,
                ),
              ),

//                  ],
//                ),
//              ),
              SizedBox(
                height: 12,
              ),
              FlatButton(
                color: kPrimaryColor(context),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.id);
//                  print(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    'ورود',
                    style: kBtnTS,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    color: kPrimaryColor(context),
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'اگر حساب کاربری ندارید ثبت نام کنید :)',
                        style: kBtnTS,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class WavyClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
//    Offset point0 = Offset( 0, 0 ); //TODO همیشه ۰ و ۰ هست در بالا جپ کانواس

    Offset point1 = Offset( 0,4*size.height/5);
    path.lineTo(point1.dx,point1.dy);
    Offset point2 = Offset(   size.width/4 , size.height);
    Offset point3 = Offset( size.width/2 , 4*size.height/5);
    path.quadraticBezierTo(point2.dx, point2.dy, point3.dx, point3.dy);
    Offset point4 = Offset( 3*size.width/4 , 3*size.height/5);
    Offset point5 = Offset( size.width , 4*size.height/5);
    path.quadraticBezierTo(point4.dx, point4.dy, point5.dx, point5.dy);
    Offset point6 = Offset( size.width , 0.25*size.height);
    path.lineTo(point6.dx, point6.dy);
    Offset point7 = Offset( 0.75*size.width , 0.08*size.height); //Offset( 0.13*size.width , 0.4*size.height);
    Offset point8 = Offset( 0.5*size.width , 0.15*size.height);
    path.quadraticBezierTo(point7.dx, point7.dy, point8.dx, point8.dy);
    Offset point9 = Offset( 0.13*size.width , 0.37*size.height);//Offset( 0.75*size.width , 0);
    Offset point10 = Offset( 0, 0);
    path.quadraticBezierTo(point9.dx, point9.dy, point10.dx, point10.dy);



    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {

    return false;
  }

}