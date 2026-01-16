import 'package:flutter/material.dart';
import '../models/pedido.dart';
import '../models/producto.dart';
import '../data/data.dart';

class HomeViewModel extends ChangeNotifier {
  final List<Pedido> _pedidos = [];

  List<Pedido> get pedidos => _pedidos;

  HomeViewModel() {
    _cargarDatosIniciales();
  }

  void _cargarDatosIniciales() {
    
    final pedido1 = Pedido(
      id: 1,
      idMesa: 'Mesa 1',
      productos: {
        mockProductos[0]: 2,
        mockProductos[1]: 1,
        mockProductos[3]: 3,
      },
    );

    final pedido2 = Pedido(
      id: 2,
      idMesa: 'Mesa 5',
      productos: {
        mockProductos[2]: 1,
        mockProductos[4]: 2,
      },
    );

    final pedido3 = Pedido(
      id: 3,
      idMesa: 'Barra',
      productos: {
        mockProductos[5]: 4,
        mockProductos[0]: 1,
      },
    );

    _pedidos.addAll([pedido1, pedido2, pedido3]);
    notifyListeners();
  }

  void agregarPedido(Pedido pedido) {
    _pedidos.add(pedido);
    notifyListeners();
  }
}