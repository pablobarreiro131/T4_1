import 'package:t4_1/models/producto.dart';

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