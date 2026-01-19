import 'package:flutter/material.dart';
import '../models/pedido.dart';
import '../models/producto.dart';
import '../data/data.dart';

/// ViewModel para la pantalla principal.
/// Gestiona la lista de pedidos y proporciona métodos para agregar nuevos pedidos y cargar datos iniciales.

class HomeViewModel extends ChangeNotifier {
  final List<Pedido> _pedidos = [];

  List<Pedido> get pedidos => _pedidos;

/// Constructor que carga datos iniciales al crear una instancia del ViewModel.
/// Se llama al método `_cargarDatosIniciales` para poblar la lista de pedidos con datos de ejemplo.

  HomeViewModel() {
    _cargarDatosIniciales();
  }

/// Aquí se guardan una serie de pedidos de mock que sirven para que la aplicación no empiece vacía.
/// Se cargan 3 pedidos con diferentes productos y cantidades. En diferentes mesas.

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

/// Agrega un nuevo pedido a la lista de pedidos.
/// Recibe un objeto `Pedido` como parámetro y lo añade a la lista.
/// Se utiliza en HomeView para actualizar la lista cuando se crea un nuevo pedido.

  void agregarPedido(Pedido pedido) {
    _pedidos.add(pedido);
    notifyListeners();
  }
}