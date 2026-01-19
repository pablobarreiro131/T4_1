import 'package:flutter/material.dart';
import 'package:t4_1/data/data.dart';
import 'package:t4_1/models/producto.dart';

/// ViewModel para la selección de productos.
/// Gestiona la lista de todos los productos y los productos seleccionados con sus cantidades.

class SeleccionProducto extends ChangeNotifier{
  final List<Producto> todosProductos = mockProductos;
  final Map<Producto, int> _productosSeleccionados = {};

    SeleccionProducto({Map<Producto, int>? productosIniciales}) {
    if (productosIniciales != null) {
      _productosSeleccionados.addAll(productosIniciales);
    }
  }

  Map<Producto, int> get productosSeleccionados => _productosSeleccionados;

/// Cambia el estado de selección de un producto.
/// Si el producto está seleccionado, lo elimina; si no, lo añade con cantidad 1.
/// Se utiliza para seleccionar o deseleccionar productos en la vista de selección de productos.

  void cambiarEstadoProducto(Producto p){
    if(_productosSeleccionados.containsKey(p)){
      _productosSeleccionados.remove(p);
    } else _productosSeleccionados[p] = 1;
    notifyListeners();
  }

/// Aumenta la cantidad de un producto seleccionado en 1.
/// Si el producto no está seleccionado, no hace nada.
/// Se utiliza para ajustar la cantidad de productos en la vista de selección de productos, cuando ya están seleccionados.

  void aumentarCantidad(Producto p){
    if(_productosSeleccionados.containsKey(p)){
      _productosSeleccionados[p] = _productosSeleccionados[p]! + 1;
      notifyListeners();
    }
  }

/// Disminuye la cantidad de un producto seleccionado en 1, si la cantidad es mayor que 1.
/// Si el producto no está seleccionado o la cantidad es 1, no hace nada.
/// Se utiliza para disminuir la cantidad de productos en la vista de selección de productos, cuando ya están seleccionados.

  void disminuirCantidad(Producto p){
    if(_productosSeleccionados.containsKey(p) && _productosSeleccionados[p]! > 1){
      _productosSeleccionados[p] = _productosSeleccionados[p]! - 1;
      notifyListeners();
    }
  }

/// Verifica si un producto está seleccionado.
/// Devuelve true si el producto está en la lista de productos seleccionados, false en caso contrario.
/// Se utiliza para mostrar el estado de selección en la checkbox de la vista de selección de productos.

  bool estaSeleccionado(Producto p) => _productosSeleccionados.containsKey(p);
}