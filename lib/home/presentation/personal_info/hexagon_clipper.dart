import 'dart:math';
import 'package:flutter/material.dart';

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double radius = size.width / 2;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    for (int i = 0; i < 6; i++) {
      final angleDeg = 60 * i; // empieza en 0° en lugar de -30°
      final angleRad = pi / 180 * angleDeg;

      final x = centerX + radius * cos(angleRad);
      final y = centerY + radius * sin(angleRad);
      if(i == 0){
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;

}