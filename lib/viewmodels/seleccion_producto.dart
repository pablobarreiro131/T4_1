import 'package:flutter/material.dart';
import 'package:t4_1/data/data.dart';
import 'package:t4_1/models/producto.dart';

class SeleccionProducto extends ChangeNotifier{
  final List<Producto> todosProductos = mockProductos;
  final List<Producto> _productosSeleccionados = [];

  List<Producto> get productosSeleccionados => _productosSeleccionados;

  void cambiarEstadoProducto(Producto p){
    if(productosSeleccionados.contains(p)){
      productosSeleccionados.remove(p);
    } else productosSeleccionados.add(p);
    notifyListeners();
  }

  bool estaSeleccionado(Producto p) => productosSeleccionados.contains(p);
}