import 'package:flutter/material.dart';
import '../models/pedido.dart';

class ResumenPedidoView extends StatelessWidget {
  static const routeName = '/resumen';

  const ResumenPedidoView({super.key});

  @override
  Widget build(BuildContext context) {
    final Pedido pedido = ModalRoute.of(context)!.settings.arguments as Pedido;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen del Pedido'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Mesa / Cliente'),
            subtitle: Text(pedido.idMesa),
          ),
          const Divider(),
          ListTile(
            title: Text('Productos (${pedido.totalItems} items)'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: pedido.productos.length,
              itemBuilder: (context, index) {
                final entry = pedido.productos.entries.elementAt(index);
                final producto = entry.key;
                final cantidad = entry.value;
                final subtotal = producto.precio * cantidad;

                return ListTile(
                  leading: Text('$cantidad x'),
                  title: Text(producto.nombre),
                  subtitle: Text('${producto.precio.toStringAsFixed(2)} €'),
                  trailing: Text('${subtotal.toStringAsFixed(2)} €'),
                );
              },
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('TOTAL A PAGAR:'),
            trailing: Text(
              '${pedido.total.toStringAsFixed(2)} €',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}