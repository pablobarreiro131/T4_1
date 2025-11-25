import 'package:flutter/material.dart';
import '../viewmodels/home.dart';
import '../models/pedido.dart';
import 'crear_pedido_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel vm = HomeViewModel();

  void _irACrearPedido() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CrearPedidoView()),
    );
    if (result != null && mounted) {
      final nuevoPedido = result as Pedido;
      vm.agregarPedido(nuevoPedido);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos del Bar'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListenableBuilder(
        listenable: vm,
        builder: (context, child) {
          if (vm.pedidos.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.receipt_long, size: 80, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text(
                    'No hay pedidos',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: vm.pedidos.length,
            itemBuilder: (context, index) {
              final pedido = vm.pedidos[index];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    child: Text('${pedido.totalItems}'),
                  ),
                  title: Text(
                    pedido.idMesa,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '${pedido.productos.length} productos',
                    style: const TextStyle(fontSize: 12),
                  ),
                  trailing: Text(
                    '${pedido.total.toStringAsFixed(2)} €',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.green,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _irACrearPedido,
        label: const Text('Nuevo Pedido'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}