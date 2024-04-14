import 'package:flutter/material.dart';


class BottomNavBarClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}