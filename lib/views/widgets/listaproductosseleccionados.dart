import 'package:flutter/material.dart';
import '../../models/producto.dart';
import '../../data/appcolors.dart';

class ListaProductosSeleccionados extends StatelessWidget {
  final Map<Producto, int> productos;

  const ListaProductosSeleccionados({
    super.key,
    required this.productos,
  });

  @override
  Widget build(BuildContext context) {
    if (productos.isEmpty) {
      return Container(
        child: const Center(
          child: Text(
            'No hay productos seleccionados',
            style: TextStyle(color: AppColors.textOnLight),
          ),
        ),
      );
    }

    return Container(
      child: ListView.separated(
      itemCount: productos.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final entry = productos.entries.elementAt(index);
        final producto = entry.key;
        final cantidad = entry.value;
        final subtotal = producto.precio * cantidad;

        return ListTile(
          leading: Text(
            '$cantidad x',
            style: const TextStyle(
              color: AppColors.textOnLight,
              fontWeight: FontWeight.bold,
            ),
          ),
          title: Text(
            producto.nombre,
            style: const TextStyle(color: AppColors.textOnLight),
          ),
          subtitle: Text(
            '${producto.precio.toStringAsFixed(2)} € × $cantidad',
            style: TextStyle(color: AppColors.textOnLight.withOpacity(0.7)),
          ),
          trailing: Text(
            '${subtotal.toStringAsFixed(2)} €',
            style: const TextStyle(
              color: AppColors.textOnLight,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
      ),
    );
  }
}