import 'package:flutter/material.dart';
import 'package:t4_1/models/producto.dart';
import 'package:t4_1/viewmodels/seleccion_producto.dart';

class SeleccionProductoView extends StatefulWidget {
  const SeleccionProductoView({super.key});

  @override
  State<SeleccionProductoView> createState() => _SeleccionProductoViewState();
}

class _SeleccionProductoViewState extends State<SeleccionProductoView> {
  final SeleccionProducto viewmodel = SeleccionProducto();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Elige productos: "),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: viewmodel,
        builder: (context, child) {
          return ListView.builder(
            itemCount: viewmodel.todosProductos.length,
            itemBuilder: (context, index) {
              final producto = viewmodel.todosProductos[index];
              return CheckboxListTile(
                title: Text(producto.nombre),
                subtitle: Text('${producto.precio} €'),
                value: viewmodel.estaSeleccionado(producto),
                onChanged: (bool? value) {
                  viewmodel.cambiarEstadoProducto(producto);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: ListenableBuilder(
        listenable: viewmodel,
        builder: (context, child) {
          return viewmodel.productosSeleccionados.isNotEmpty ? FloatingActionButton.extended(
                  label: const Text("Confirmar"),
                  icon: const Icon(Icons.check),
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
