import 'package:flutter/material.dart';
import '../models/producto.dart';
import '../models/pedido.dart';
import '../viewmodels/crear_pedido.dart';
import 'seleccion_producto_view.dart';
import 'widgets/inputmesa.dart';
import 'widgets/listaproductosseleccionados.dart';
import 'widgets/footer.dart';

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
      MaterialPageRoute(builder: (context) => const SeleccionProductoView()),
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
      appBar: AppBar(
        title: const Text('Crear Pedido'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          InputNombreMesa(onChanged: (valor) => vm.setIdMesa(valor)),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.add_shopping_cart),
              label: ListenableBuilder(
                listenable: vm,
                builder: (context, child) {
                  return Text(
                    vm.productosPedido.isEmpty
                        ? 'Añadir productos'
                        : 'Productos (${vm.productosPedido.length})',
                  );
                },
              ),
              onPressed: _irASeleccionProductos,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ),
          const SizedBox(height: 16),
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
