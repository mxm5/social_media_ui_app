import 'package:flutter/material.dart';
import 'package:social_media_ui_app/constants/fonts.dart';
import 'package:social_media_ui_app/constants/styles.dart';
import 'package:social_media_ui_app/data/data.dart';
import 'package:social_media_ui_app/models/post_model.dart';
import 'package:social_media_ui_app/models/user_model.dart';

class PostCarousel extends StatelessWidget {
  final PageController pageController;

  PostCarousel({this.pageController});



  @override

  Widget build(BuildContext context) {
//    pageController.jumpToPage(5);
    return Container(
      height: 370,
      child: PageView.builder(

          reverse: true,
          itemCount: 13,
          controller: pageController,

          itemBuilder: (context, idx) {
            final User user = users[idx % 7];
            final Post post = posts[idx % 3+3];
            return AnimatedBuilder(
              animation: pageController,
              builder: (BuildContext context, Widget widget) {
                double val = 1;
                // print(pageController.page-idx);
                // print(pageController.position);// TODO : همه ی اینا مثل انیمیشن ها و تیکر های انیمیشن قابل تغییر هستند
                if (pageController.position.haveDimensions) {
                  val = pageController.page - idx;
                  val = (1 -
                      (val.abs() * 0.35)// TODO: کلا ما چون تغییرات از صفر شروع میشن و خیلی سریع هستن کلشون رونمیخوایم و ۶۵ درصدشونو میخوایم
                  ).clamp(0, 1);
                }
                return Center(
                    child: SizedBox(
                      height: Curves.easeInOut.transform(val) * 400,
                      child: widget,
                    ));
              },
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: //Stack(
//                  children: <Widget>[
                    CarouselCard(post: post, user: user),
//                    Image(
//                      height: 370,width: 370,fit: BoxFit.cover,
//                      image: AssetImage(user.profileImageUrl),
//                    ),
//                  ],
//                ),
              ),
            );
          }),
    );
  }
}

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    Key key,
    @required this.post,
    @required this.user,
  }) : super(key: key);

  final Post post;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 110,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.65),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15))),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                post.title,
                style: kNormalTS,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                post.location,
                style: kNormalTS,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        stringPersianNumberOf(
                            post.likes.toString()),
                        style: kNormalTS,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        stringPersianNumberOf(
                            post.comments.toString()),
                        style: kNormalTS,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Icon(
                        Icons.comment,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(offset: Offset(0, 0), blurRadius: 2)
        ],
        image: DecorationImage(
            image: AssetImage(user.profileImageUrl),
            fit: BoxFit.cover),
      ),
    );
  }
}
