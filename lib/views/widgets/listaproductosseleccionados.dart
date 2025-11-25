import 'package:flutter/material.dart';
import '../../models/producto.dart'; // Ajusta la ruta según donde tengas tus modelos

class ListaProductosSeleccionados extends StatelessWidget {
  final List<Producto> productos;

  const ListaProductosSeleccionados({super.key, required this.productos});

  @override
  Widget build(BuildContext context) {
    if (productos.isEmpty) {
      return const Center(
        child: Text(
          'No hay productos seleccionados',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return ListView.separated(
      itemCount: productos.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final prod = productos[index];
        return ListTile(
          leading: const Icon(Icons.fastfood, size: 20, color: Colors.orange),
          title: Text(prod.nombre),
          trailing: Text('${prod.precio.toStringAsFixed(2)} €'),
          dense: true,
        );
      },
    );
  }
}
