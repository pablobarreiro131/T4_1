import 'package:flutter/material.dart';
import '../../models/producto.dart';
import '../viewmodels/seleccion_producto.dart';

class SeleccionProductoView extends StatefulWidget {
  final Map<Producto, int>? productosIniciales; // NUEVO

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
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListenableBuilder(
        listenable: viewmodel,
        builder: (context, child) {
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: viewmodel.todosProductos.length,
            itemBuilder: (context, index) {
              final producto = viewmodel.todosProductos[index];
              final estaSeleccionado = viewmodel.estaSeleccionado(producto);
              final cantidad = viewmodel.productosSeleccionados[producto] ?? 1;

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                elevation: estaSeleccionado ? 4 : 1,
                color: estaSeleccionado 
                    ? Theme.of(context).colorScheme.primaryContainer 
                    : null,
                child: ListTile(
                  leading: Checkbox(
                    value: estaSeleccionado,
                    onChanged: (bool? value) {
                      viewmodel.cambiarEstadoProducto(producto);
                    },
                  ),
                  title: Text(
                    producto.nombre,
                    style: TextStyle(
                      fontWeight: estaSeleccionado 
                          ? FontWeight.bold 
                          : FontWeight.normal,
                    ),
                  ),
                  subtitle: Text(
                    '${producto.precio.toStringAsFixed(2)} €',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: estaSeleccionado
                      ? Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove, size: 18),
                                color: Colors.white,
                                onPressed: () {
                                  viewmodel.disminuirCantidad(producto);
                                },
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(
                                  minWidth: 32,
                                  minHeight: 32,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  '$cantidad',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add, size: 18),
                                color: Colors.white,
                                onPressed: () {
                                  viewmodel.aumentarCantidad(producto);
                                },
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(
                                  minWidth: 32,
                                  minHeight: 32,
                                ),
                              ),
                            ],
                          ),
                        )
                      : null,
                ),
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
              ? FloatingActionButton.extended(
                  label: Text("Confirmar ($totalProductos)"),
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