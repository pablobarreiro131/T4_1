import 'package:flutter/material.dart';
import 'package:t4_1/models/producto.dart';
import 'package:t4_1/viewmodels/seleccion_producto.dart';
import 'package:t4_1/models/orden.dart';


class ResumenPedidoView extends StatelessWidget {

  static const routeName = '/resumen';

  const ResumenPedidoView({super.key});

  @override
  Widget build(BuildContext context) {

    final Orden pedido = ModalRoute.of(context)!.settings.arguments as Orden;

    return Scaffold(
      appBar: AppBar(title: const Text('Resumen del Pedido')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mesa: ${pedido.idMesa}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: pedido.productos.length,
                itemBuilder: (context, index) {
                  final prod = pedido.productos[index];
                  return ListTile(
                    title: Text(prod.nombre),
                    trailing: Text('${prod.precio.toStringAsFixed(2)} €'),
                  );
                },
              ),
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.green.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('TOTAL A PAGAR:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('${pedido.total.toStringAsFixed(2)} €', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}