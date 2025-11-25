import 'package:flutter/material.dart';
import '../models/pedido.dart';
import '../models/producto.dart';

class HomeViewModel extends ChangeNotifier {
  final List<Pedido> _pedidos = [];

  List<Pedido> get pedidos => List.unmodifiable(_pedidos);

  void agregarPedido(Pedido pedido) {
    _pedidos.add(pedido);
    notifyListeners();
  }
}