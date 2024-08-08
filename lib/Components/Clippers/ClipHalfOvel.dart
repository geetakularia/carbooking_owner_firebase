import 'package:flutter/material.dart';

class ClipHalfOvel extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height);
    path.cubicTo(0, 0, size.width, 0, size.width, size.height);
    // path.cubicTo(0, 0, size.width, 0, size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class ClipHalfOvel_home extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.cubicTo(
        size.height * 2, 10, size.width, 0, size.width * 3, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
