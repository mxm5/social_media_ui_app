import 'package:flutter/material.dart';
import 'package:social_media_ui_app/constants/styles.dart';
import 'package:social_media_ui_app/data/data.dart';
import 'package:social_media_ui_app/models/user_model.dart';
import 'package:social_media_ui_app/screen/story_screen.dart';

class FriendsList extends StatelessWidget {
  const FriendsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: ListView.builder(
          reverse: true,
          itemCount: users.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, idx) {
            final User user = users[idx];
            return Padding(
              padding: EdgeInsets.only(bottom: 10, top: 10, right: 13),
              child: Hero(
                tag: user.profileImageUrl,
                child: GestureDetector(
                  onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (context)=>StoryScreen(idx: idx,)));
//                  Navigator.pushNamed(context, StoryScreen.id,);
                  },
                  //splashColor: kPrimaryColor(context),
                  // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(70),))
                  // ,padding: EdgeInsets.all(0),
                  child: Container(
                    width: 70,
                    decoration: BoxDecoration(
                        border:
                        Border.all(color: kAccentColor(context), width: 1.5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(0, 0),
                              blurRadius: 0.5)
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              user.profileImageUrl,
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
