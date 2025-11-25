import 'package:flutter/material.dart';
import 'package:t4_1/models/orden.dart';
import 'package:t4_1/models/producto.dart';

class CrearOrden extends ChangeNotifier {
  static int contador = 1;
  String _idMesa = '';
  List<Producto> _productosOrden = [];

  List<Producto> get productosOrden => _productosOrden;

  double get total =>
      _productosOrden.fold(0.0, (sum, item) => sum + item.precio);

  bool get esValida => _idMesa.isNotEmpty && _productosOrden.isNotEmpty;

  String get idMesa => _idMesa;

  void setIdMesa(String idMesa) {
    _idMesa = idMesa;
    notifyListeners();
  }

  void actualizarProductos(List<Producto> productos) {
    _productosOrden = productos;
    notifyListeners();
  }

  Orden? crearOrden() {
    if (!esValida) return null;

    final orden = Orden(
      id: contador++,
      idMesa: _idMesa,
      productos: _productosOrden,
      fecha: DateTime.now(),
    );
    return orden;
  }
}
