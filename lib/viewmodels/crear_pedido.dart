import 'package:flutter/material.dart';
import 'package:t4_1/models/pedido.dart';
import 'package:t4_1/models/producto.dart';

/// ViewModel para la creación de un pedido.
/// Gestiona el ID de la mesa, los productos seleccionados y proporciona métodos para actualizar estos datos y crear un nuevo pedido.

class CrearPedido extends ChangeNotifier {
  static int contador = 1;
  String _idMesa = '';
  Map<Producto, int> _productosPedido = {};

  Map<Producto, int> get productosPedido => _productosPedido;

/// Calcula el total del pedido sumando el precio de cada producto multiplicado por su cantidad.
/// Devuelve el total como un valor double.

  double get total =>
      _productosPedido.entries.fold(0.0, (sum, entry) => sum + entry.key.precio * entry.value);

/// Verifica si los datos del pedido son válidos comprobando si el ID de la mesa no está vacío y si hay productos seleccionados.
/// Se utiliza antes de crear un nuevo pedido para asegurarse de que los datos son correctos.

  bool get esValida => _idMesa.isNotEmpty && _productosPedido.isNotEmpty;

/// Obtiene el ID de la mesa actual.
/// Se utiliza para mostrar el ID de la mesa en la vista de creación de pedidos.

  String get idMesa => _idMesa;

/// Establece el ID de la mesa.
/// Se utiliza para actualizar el ID de la mesa cuando el usuario lo introduce en la vista.

  void setIdMesa(String idMesa) {
    _idMesa = idMesa;
    notifyListeners();
  }
/// Actualiza los productos del pedido con el mapa proporcionado.
/// Se utiliza para establecer los productos seleccionados y sus cantidades en el pedido.
/// Se utiliza para actualizar los productos seleccionados en el ViewModel cuando se regresa de la vista de selección de productos.
  void actualizarProductos(Map<Producto, int> productos) {
    _productosPedido = productos;
    notifyListeners();
  }

/// Crea un nuevo pedido si los datos son válidos.
/// Devuelve el pedido creado o null si los datos no son válidos.
/// El ID del pedido se genera automáticamente utilizando el atributo `contador`.

  Pedido? crearPedido() {
    if (!esValida) return null;

    final pedido = Pedido(
      id: contador++,
      idMesa: _idMesa,
      productos: _productosPedido,
    );
    return pedido;
  }
}