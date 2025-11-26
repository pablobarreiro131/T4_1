import 'package:flutter/material.dart';
import '../../models/producto.dart';
import '../viewmodels/seleccion_producto.dart';

class SeleccionProductoView extends StatefulWidget {
  final Map<Producto, int>? productosIniciales;

  const SeleccionProductoView({super.key, this.productosIniciales});

  @override
  State<SeleccionProductoView> createState() => _SeleccionProductoViewState();
}

class _SeleccionProductoViewState extends State<SeleccionProductoView> {
  late final SeleccionProducto viewmodel;

  @override
  void initState() {
    super.initState();
    viewmodel = SeleccionProducto(productosIniciales: widget.productosIniciales);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Elige productos"),
      ),
      body: ListenableBuilder(
        listenable: viewmodel,
        builder: (context, child) {
          return ListView.builder(
            itemCount: viewmodel.todosProductos.length,
            itemBuilder: (context, index) {
              final producto = viewmodel.todosProductos[index];
              final estaSeleccionado = viewmodel.estaSeleccionado(producto);
              final cantidad = viewmodel.productosSeleccionados[producto] ?? 1;

              return ListTile(
                leading: Checkbox(
                  value: estaSeleccionado,
                  onChanged: (_) => viewmodel.cambiarEstadoProducto(producto),
                ),
                title: Text(producto.nombre),
                subtitle: Text('${producto.precio.toStringAsFixed(2)} €'),
                trailing: estaSeleccionado
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => viewmodel.disminuirCantidad(producto),
                          ),
                          Text('$cantidad'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => viewmodel.aumentarCantidad(producto),
                          ),
                        ],
                      )
                    : null,
              );
            },
          );
        },
      ),
      floatingActionButton: ListenableBuilder(
        listenable: viewmodel,
        builder: (context, child) {
          final totalProductos = viewmodel.productosSeleccionados.length;
          return totalProductos > 0
              ? FloatingActionButton(
                  child: const Icon(Icons.check),
                  onPressed: () {
                    Navigator.pop(context, viewmodel.productosSeleccionados);
                  },
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}