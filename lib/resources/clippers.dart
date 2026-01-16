import 'package:flutter/material.dart';

class RecorteInferiorClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    double x = 0;
    double tamanoDiente = 12;
    double profundidad = 8;
    while (x < size.width) {
      path.lineTo(x + (tamanoDiente / 2), size.height - profundidad);
      path.lineTo(x + tamanoDiente, size.height);
      x += tamanoDiente;
    }
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class RecorteDerechoClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    double y = 0;
    double tamanoDiente = 12;
    double profundidad = 8;
    while (y < size.height) {
      path.lineTo(size.width - profundidad, y + (tamanoDiente / 2));
      path.lineTo(size.width, y + tamanoDiente);
      y += tamanoDiente;
    }
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class RecorteSuperiorClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    double x = size.width;
    double tamanoDiente = 12;
    double profundidad = 8;
    while (x > 0) {
      path.lineTo(x - (tamanoDiente / 2), profundidad);
      path.lineTo(x - tamanoDiente, 0);
      x -= tamanoDiente;
    }
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}