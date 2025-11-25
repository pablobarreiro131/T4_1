import 'package:flutter/material.dart';
import '../viewmodels/home.dart';
import '../models/orden.dart';
import 'crear_pedido_view.dart'; // Importamos la vista de creación

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
      final nuevaOrden = result as Orden;
      vm.agregarPedido(nuevaOrden);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pedido de ${nuevaOrden.idMesa} guardado')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BarCommand Pro 🍺'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _irACrearPedido,
        label: const Text('Nuevo Pedido'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListenableBuilder(
        listenable: vm,
        builder: (context, child) {
          if (vm.pedidos.isEmpty) {
            return const Center(child: Text("No hay pedidos activos"));
          }

          return ListView.builder(
            itemCount: vm.pedidos.length,
            itemBuilder: (context, index) {
              final orden = vm.pedidos[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.indigo.shade100,
                    child: Text('${orden.id}'),
                  ),
                  title: Text(
                    orden.idMesa,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${orden.totalItems} productos'),
                  trailing: Text(
                    '${orden.total.toStringAsFixed(2)} €',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
