import 'package:flutter/material.dart';
import '../models/orden.dart';
import '../models/producto.dart';

class HomeViewModel extends ChangeNotifier {
  final List<Orden> _pedidos = [];

  List<Orden> get pedidos => List.unmodifiable(_pedidos);

  HomeViewModel() {
    _cargarDatosIniciales();
  }

  void _cargarDatosIniciales() {
    final pedidoEjemplo = Orden(
      id: 999,
      idMesa: "Mesa 1 (Existente)",
      fecha: DateTime.now().subtract(const Duration(minutes: 30)),
      productos: [
        Producto(id: 1, nombre: 'Cerveza', precio: 2.5),
        Producto(id: 4, nombre: 'Tortilla', precio: 5.0),
      ],
    );

    _pedidos.add(pedidoEjemplo);
  }

  void agregarPedido(Orden orden) {
    _pedidos.add(orden);
    notifyListeners();
  }
}
