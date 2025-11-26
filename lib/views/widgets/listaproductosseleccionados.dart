import 'package:flutter/material.dart';
import '../../models/producto.dart';

class ListaProductosSeleccionados extends StatelessWidget {
  final Map<Producto, int> productos;

  const ListaProductosSeleccionados({
    super.key,
    required this.productos,
  });

  @override
  Widget build(BuildContext context) {
    if (productos.isEmpty) {
      return const Center(
        child: Text('No hay productos seleccionados'),
      );
    }

    return ListView.separated(
      itemCount: productos.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final entry = productos.entries.elementAt(index);
        final producto = entry.key;
        final cantidad = entry.value;
        final subtotal = producto.precio * cantidad;

        return ListTile(
          leading: Text('$cantidad x'),
          title: Text(producto.nombre),
          subtitle: Text('${producto.precio.toStringAsFixed(2)} € × $cantidad'),
          trailing: Text('${subtotal.toStringAsFixed(2)} €'),
        );
      },
    );
  }
}