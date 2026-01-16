import 'package:flutter/material.dart';
import '../models/pedido.dart';
import '../data/appcolors.dart';
import '../resources/clippers.dart';

class ResumenPedidoView extends StatelessWidget {
  static const routeName = '/resumen';

  const ResumenPedidoView({super.key});

  @override
  Widget build(BuildContext context) {
    final Pedido pedido = ModalRoute.of(context)!.settings.arguments as Pedido;

    return Scaffold(
      backgroundColor: AppColors.backgroundSlate,
      appBar: AppBar(
        title: const Text(
          'Resumen del Pedido',
          style: TextStyle(color: AppColors.textOnDark),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.textOnDark),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PhysicalShape(
          color: AppColors.ticketPaper,
          clipper: RecorteInferiorClipper(),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.restaurant_menu,
                        size: 40,
                        color: AppColors.textOnLight,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'TICKET',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textOnLight,
                        ),
                      ),
                      const Divider(height: 20, thickness: 2),
                    ],
                  ),
                ),

                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Mesa: ',
                    style: TextStyle(
                      color: AppColors.textOnLight,
                      fontSize: 12,
                    ),
                  ),
                  subtitle: Text(
                    pedido.idMesa,
                    style: TextStyle(
                      color: AppColors.textOnLight,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),

                const Divider(),

                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Productos (${pedido.totalItems} items)',
                    style: TextStyle(
                      color: AppColors.textOnLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: pedido.productos.length,
                    itemBuilder: (context, index) {
                      final entry = pedido.productos.entries.elementAt(index);
                      final producto = entry.key;
                      final cantidad = entry.value;
                      final subtotal = producto.precio * cantidad;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            Text(
                              '$cantidad x',
                              style: TextStyle(
                                color: AppColors.textOnLight,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    producto.nombre,
                                    style: TextStyle(
                                      color: AppColors.textOnLight,
                                    ),
                                  ),
                                  Text(
                                    '${producto.precio.toStringAsFixed(2)} €',
                                    style: TextStyle(
                                      color: AppColors.textOnLight,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '${subtotal.toStringAsFixed(2)} €',
                              style: TextStyle(
                                color: AppColors.textOnLight,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const Divider(thickness: 2),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TOTAL A PAGAR:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.textOnLight,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 6.0,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(
                          '${pedido.total.toStringAsFixed(2)} €',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textOnDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
