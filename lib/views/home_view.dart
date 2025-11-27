import 'package:flutter/material.dart';
import '../viewmodels/home.dart';
import '../models/pedido.dart';
import 'crear_pedido_view.dart';
import '../data/appcolors.dart';
import '../resources/clippers.dart';


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

    void _verResumenPedido(Pedido pedido) {
    Navigator.pushNamed(
      context,
      '/resumen',
      arguments: pedido,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSlate,
      appBar: AppBar(
        title: const Text(
          'Comandas',
          style: TextStyle(color: AppColors.textOnDark),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: ListenableBuilder(
        listenable: vm,
        builder: (context, child) {
          if (vm.pedidos.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.sentiment_dissatisfied,
                    color: AppColors.primaryTransparent,
                    size: 80,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Aun no hay pedidos...',
                    style: TextStyle(color: AppColors.textOnLight),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: vm.pedidos.length,
            itemBuilder: (context, index) {
              final pedido = vm.pedidos[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: PhysicalShape(
                  color: AppColors.ticketPaper,
                  clipper: RecorteDerechoClipper(),
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: ListTile(
                      onTap: () => _verResumenPedido(pedido),
                      leading: Icon(
                        Icons.restaurant_menu,
                        color: AppColors.textOnLight,
                      ),
                      title: Text(
                        pedido.idMesa,
                        style: TextStyle(color: AppColors.textOnLight, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${pedido.totalItems} productos',
                        style: TextStyle(color: AppColors.textOnLight),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(
                          '${pedido.total.toStringAsFixed(2)} €',
                          style: const TextStyle(
                            color: AppColors.textOnDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _irACrearPedido,
        child: const Icon(Icons.add, color: AppColors.textOnDark),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
