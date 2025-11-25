import 'package:flutter/material.dart';

class Producto {
  final int id;
  final String nombre;
  final double precio;

  Producto({required this.id, required this.nombre, required this.precio});
}

class ProductoCantidad {
  final Producto producto;
  int cantidad;

  ProductoCantidad({required this.producto, this.cantidad = 1});

  double get subtotal => producto.precio * cantidad;
}