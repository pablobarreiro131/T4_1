import 'package:flutter/material.dart';

/// Modelo que representa un producto en el sistema.
class Producto {
  final int id;
  final String nombre;
  final double precio;

  Producto({required this.id, required this.nombre, required this.precio});
}
