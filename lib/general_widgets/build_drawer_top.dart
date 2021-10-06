import 'package:flutter/material.dart';
import 'package:social_media_ui_app/constants/fonts.dart';
import 'package:social_media_ui_app/constants/styles.dart';
import 'package:social_media_ui_app/data/data.dart';

class BuildDrawerTop extends StatelessWidget {
  const BuildDrawerTop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image(
          width: double.infinity,
          height: 220,
          image: AssetImage(currentUser.backgroundImageUrl),
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 20,left: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 90,width: 90,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: kAccentColor(context),width: 2)
                ),
                child: ClipOval(child: Image(image: AssetImage(currentUser.profileImageUrl),fit: BoxFit.cover,),),
              ),
              Container(child: Text(' فاطمه سعیدی',style: TextStyle(fontFamily: kF_Vazir,color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),),decoration: BoxDecoration(
                boxShadow: [BoxShadow( offset: Offset(0,0),blurRadius: 14,color: Colors.black.withOpacity(0.77),),],

              ),)
            ],
          ),
        )
      ],
    );
  }
}
