import 'package:flutter/material.dart';

/// Clipper personalizado para crear un borde dentado en la parte inferior de un widget.
/// Se utiliza para dar un efecto visual de borde recortado en la parte inferior.
/// Extiende CustomClipper<Path> y sobrescribe el método getClip para definir la forma del recorte.

/// Clipper personalizado para crear un borde dentado en la parte inferior de un widget.
/// Se utiliza para dar el efecto de recorte en la visualización de detalle del pedido.
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

/// Clipper personalizado para crear un borde dentado en la parte derecha de un widget.
/// Se utiliza para dar el efecto de recorte en la HomeView en el borde derecho de los tickets.
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

/// Clipper personalizado para crear un borde dentado en la parte superior de un widget.
/// Se utiliza para dar un efecto visual de borde recortado en la parte superior, en la vista de creación de pedidos. 
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