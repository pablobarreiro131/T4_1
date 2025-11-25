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
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'No hay productos seleccionados',
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      itemCount: productos.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final entry = productos.entries.elementAt(index);
        final producto = entry.key;
        final cantidad = entry.value;
        final subtotal = producto.precio * cantidad;

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
            child: Text('$cantidad'),
          ),
          title: Text(producto.nombre),
          subtitle: Text(
            '${producto.precio.toStringAsFixed(2)} € × $cantidad',
            style: const TextStyle(fontSize: 12),
          ),
          trailing: Text(
            '${subtotal.toStringAsFixed(2)} €',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.green,
            ),
          ),
          dense: true,
        );
      },
    );
  }
}