import 'package:flutter/material.dart';
import 'package:t4_1/data/data.dart';
import 'package:t4_1/models/producto.dart';

class SeleccionProducto extends ChangeNotifier{
  final List<Producto> todosProductos = mockProductos;
  final Map<Producto, int> _productosSeleccionados = {};

    SeleccionProducto({Map<Producto, int>? productosIniciales}) {
    if (productosIniciales != null) {
      _productosSeleccionados.addAll(productosIniciales);
    }
  }

  Map<Producto, int> get productosSeleccionados => _productosSeleccionados;

  void cambiarEstadoProducto(Producto p){
    if(_productosSeleccionados.containsKey(p)){
      _productosSeleccionados.remove(p);
    } else _productosSeleccionados[p] = 1;
    notifyListeners();
  }

  void aumentarCantidad(Producto p){
    if(_productosSeleccionados.containsKey(p)){
      _productosSeleccionados[p] = _productosSeleccionados[p]! + 1;
      notifyListeners();
    }
  }

  void disminuirCantidad(Producto p){
    if(_productosSeleccionados.containsKey(p) && _productosSeleccionados[p]! > 1){
      _productosSeleccionados[p] = _productosSeleccionados[p]! - 1;
      notifyListeners();
    }
  }

  bool estaSeleccionado(Producto p) => _productosSeleccionados.containsKey(p);
}