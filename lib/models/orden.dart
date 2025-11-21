import 'package:t4_1/models/producto.dart';

class Orden {
  final int id;
  final String idMesa;
  final List<Producto> productos;
  final DateTime fecha;

  Orden({
    required this.id,
    required this.idMesa,
    required this.productos,
    required this.fecha
  });

  double get total {
    return productos.fold(0.0, (sum, item) => sum + item.precio);
  }

  int get totalItems => productos.length;
}