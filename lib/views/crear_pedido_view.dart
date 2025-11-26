import 'package:flutter/material.dart';
import '../models/producto.dart';
import '../models/pedido.dart';
import '../viewmodels/crear_pedido.dart';
import 'seleccion_producto_view.dart';
import 'widgets/inputmesa.dart';
import 'widgets/listaproductosseleccionados.dart';
import 'widgets/footer.dart';
import '../data/appcolors.dart';

class CrearPedidoView extends StatefulWidget {
  const CrearPedidoView({super.key});

  @override
  State<CrearPedidoView> createState() => _CrearPedidoViewState();
}

class _CrearPedidoViewState extends State<CrearPedidoView> {
  final CrearPedido vm = CrearPedido();

  void _irASeleccionProductos() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SeleccionProductoView(
          productosIniciales: vm.productosPedido,
        ),
      ),
    );

    if (result != null && mounted) {
      final productos = result as Map<Producto, int>;
      vm.actualizarProductos(productos);
    }
  }

  void _guardarPedido() {
    final pedido = vm.crearPedido();
    if (pedido != null) {
      Navigator.pop(context, pedido);
    }
  }

  void _verResumen() {
    final pedido = vm.crearPedido();
    if (pedido != null) {
      Navigator.pushNamed(context, '/resumen', arguments: pedido);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSlate,
      appBar: AppBar(
        title: const Text(
          'Crear Pedido',
          style: TextStyle(color: AppColors.textOnDark),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.textOnDark),
      ),
      body: Column(
        children: [
          InputNombreMesa(onChanged: (valor) => vm.setIdMesa(valor)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _irASeleccionProductos,
              child: ListenableBuilder(
                listenable: vm,
                builder: (context, child) {
                  return Text(
                    vm.productosPedido.isEmpty
                        ? 'Añadir productos'
                        : 'Productos (${vm.productosPedido.length})',
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: ListenableBuilder(
              listenable: vm,
              builder: (context, child) {
                return ListaProductosSeleccionados(
                  productos: vm.productosPedido,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: ListenableBuilder(
        listenable: vm,
        builder: (context, child) {
          return FooterAcciones(
            total: vm.total,
            esValido: vm.esValida,
            onGuardar: _guardarPedido,
            onCancelar: () => Navigator.pop(context),
            onVerResumen: _verResumen,
          );
        },
      ),
    );
  }
}