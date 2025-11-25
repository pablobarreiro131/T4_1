import 'package:flutter/material.dart';
import '../models/pedido.dart';
import '../models/producto.dart';

class HomeViewModel extends ChangeNotifier {
  final List<Pedido> _pedidos = [];

  List<Pedido> get pedidos => List.unmodifiable(_pedidos);

  HomeViewModel() {
    _cargarDatosIniciales();
  }

  void _cargarDatosIniciales() {
    final pedidoEjemplo = Pedido(
      id: 999,
      idMesa: "Mesa 1 (Existente)",
      fecha: DateTime.now().subtract(const Duration(minutes: 30)),
      productos: {
        Producto(id: 1, nombre: 'Caña Mahou Clásica', precio: 1.70): 2,
        Producto(id: 3, nombre: 'Coca-Cola Original', precio: 2.20): 1,
      },
    );

    _pedidos.add(pedidoEjemplo);
  }

  void agregarPedido(Pedido pedido) {
    _pedidos.add(pedido);
    notifyListeners();
  }
}