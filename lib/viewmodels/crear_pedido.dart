import 'package:flutter/material.dart';
import 'package:t4_1/models/pedido.dart';
import 'package:t4_1/models/producto.dart';

class CrearPedido extends ChangeNotifier {
  static int contador = 1;
  String _idMesa = '';
  Map<Producto, int> _productosPedido = {};

  Map<Producto, int> get productosPedido => _productosPedido;

  double get total =>
      _productosPedido.entries.fold(0.0, (sum, entry) => sum + entry.key.precio * entry.value);

  bool get esValida => _idMesa.isNotEmpty && _productosPedido.isNotEmpty;

  String get idMesa => _idMesa;

  void setIdMesa(String idMesa) {
    _idMesa = idMesa;
    notifyListeners();
  }

  void actualizarProductos(Map<Producto, int> productos) {
    _productosPedido = productos;
    notifyListeners();
  }

  Pedido? crearPedido() {
    if (!esValida) return null;

    final pedido = Pedido(
      id: contador++,
      idMesa: _idMesa,
      productos: _productosPedido,
      fecha: DateTime.now(),
    );
    return pedido;
  }
}