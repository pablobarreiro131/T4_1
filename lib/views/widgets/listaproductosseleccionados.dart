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
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.fastfood_outlined,
              color: AppColors.primaryTransparent,
              size: 80,
            ),
            SizedBox(height: 8),
            Text(
              'Aun no hay productos seleccionados...',
              style: TextStyle(color: AppColors.textOnLight),
            )
          ],
        ),
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
            '${producto.precio.toStringAsFixed(2)} € x $cantidad',
            style: TextStyle(color: AppColors.textOnLight),
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
    );
  }
}