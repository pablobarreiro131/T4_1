import 'package:t4_1/models/producto.dart';

/// Modelo que representa un pedido en el sistema.
/// Contiene el ID del pedido, el ID de la mesa en la que se realizó el pedido y un mapa de productos con sus cantidades.
/// Tiene dos métodos calculados: `total`, que devuelve el precio total del pedido, y `totalItems`, que devuelve la cantidad de todos los productos en el pedido sumadas.
class Pedido {
  final int id;
  final String idMesa;
  final Map<Producto, int> productos;

  Pedido({
    required this.id,
    required this.idMesa,
    required this.productos,
  });

  double get total {
    return productos.entries.fold(0.0, (sum, entry) => sum + entry.key.precio * entry.value);
  }

  int get totalItems => productos.values.fold(0, (sum, cantidad) => sum + cantidad);
}