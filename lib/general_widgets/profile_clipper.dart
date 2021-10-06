import 'package:flutter/material.dart';

class ProfileClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {

    Path path=Path();
    path.lineTo(0, 0.8*size.height);
    Offset x1=Offset(size.width*0.5,size.height);
    Offset x2=Offset(size.width,size.height*0.8);
    path.quadraticBezierTo(x1.dx, x1.dy, x2.dx, x2.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }

}