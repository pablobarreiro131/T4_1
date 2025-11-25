import 'package:flutter/material.dart';
// IMPORTA TUS MODELOS Y VM
import '../models/producto.dart';
import '../models/orden.dart';
import '../viewmodels/crear_orden.dart'; // Ajusta el nombre si es diferente
import 'seleccion_producto_view.dart';

// IMPORTA LOS NUEVOS WIDGETS
import 'widgets/inputmesa.dart';
import 'widgets/listaproductosseleccionados.dart';
import 'widgets/footer.dart';

class CrearPedidoView extends StatefulWidget {
  const CrearPedidoView({super.key});

  @override
  State<CrearPedidoView> createState() => _CrearPedidoViewState();
}

class _CrearPedidoViewState extends State<CrearPedidoView> {
  final CrearOrden vm = CrearOrden();

  void _irASeleccionProductos() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SeleccionProductoView()),
    );

    if (result != null && mounted) {
      vm.actualizarProductos(result as List<Producto>);
    }
  }

  void _guardarPedido() {
    final orden = vm.crearOrden();
    Navigator.pop(context, orden);
  }

  void _verResumen() {
    final ordenPreview = Orden(
      id: 0,
      idMesa: vm.idMesa.isEmpty ? "Sin Nombre" : vm.idMesa,
      productos: vm.productosOrden,
      fecha: DateTime.now(),
    );

    Navigator.pushNamed(context, '/resumen', arguments: ordenPreview);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Pedido'),
        actions: [
          IconButton(
            icon: const Icon(Icons.receipt_long),
            tooltip: 'Ver Resumen',
            onPressed: _verResumen,
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: vm,
        builder: (context, child) {
          return Column(
            children: [
              InputNombreMesa(onChanged: vm.setIdMesa),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add_shopping_cart),
                  label: const Text('Seleccionar Productos'),
                  onPressed: _irASeleccionProductos,
                ),
              ),
              Expanded(
                child: ListaProductosSeleccionados(
                  productos: vm.productosOrden,
                ),
              ),
              FooterAcciones(
                total: vm.total,
                esValido: vm.esValida,
                onGuardar: _guardarPedido,
                onCancelar: () => Navigator.pop(context),
              ),
            ],
          );
        },
      ),
    );
  }
}
