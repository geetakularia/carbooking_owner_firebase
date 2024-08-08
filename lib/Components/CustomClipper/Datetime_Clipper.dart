
import 'package:flutter/material.dart';

class DatetimeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(40, size.height);
    var controlPoint = Offset(35, size.height);
    var endPoint = Offset(0, size.height - 30);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}