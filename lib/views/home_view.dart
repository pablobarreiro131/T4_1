import 'package:flutter/material.dart';
import '../viewmodels/home.dart';
import '../models/pedido.dart';
import 'crear_pedido_view.dart';
import '../data/appcolors.dart';

class RecorteDerechoClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    
    double y = 0;
    double tamanoDiente = 12;
    double profundidad = 8;
    
    while (y < size.height) {
      path.lineTo(size.width - profundidad, y + (tamanoDiente / 2));
      path.lineTo(size.width, y + tamanoDiente);
      y += tamanoDiente;
    }

    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

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
              child: Text(
                'No hay pedidos',
                style: TextStyle(color: AppColors.textOnLight),
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
                          color: AppColors.accent, // Fondo Marrón
                          borderRadius: BorderRadius.circular(4.0), // Bordes redondeados
                        ),
                        child: Text(
                          '${pedido.total.toStringAsFixed(2)} €',
                          style: const TextStyle(
                            color: AppColors.textOnDark, // Texto claro para contraste
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
