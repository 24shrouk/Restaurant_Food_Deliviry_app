import 'package:flutter/material.dart';

class Containercliper extends CustomClipper<Path> {
  var path = Path();
  @override
  Path getClip(Size size) {
    path.lineTo(0, size.height);

    path.quadraticBezierTo(size.width * 0.25, size.height - 100,
        size.width * 0.5, size.height - 50);
    path.quadraticBezierTo(
        size.width * 0.8, size.height, size.width, size.height - 50);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // throw UnimplementedError();
    return true;
  }
}
