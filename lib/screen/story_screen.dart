import 'package:flutter/material.dart';
import 'package:social_media_ui_app/data/data.dart';

class StoryScreen extends StatefulWidget {
  static const String id = 'StoryScreen';

  final int idx;

  StoryScreen({this.idx});

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: users[widget.idx].profileImageUrl, child: Image(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        image: AssetImage(users[widget.idx].profileImageUrl),fit: BoxFit.cover, )),
    );
  }
}
