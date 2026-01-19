import 'package:flutter/material.dart';
import '../../models/producto.dart';
import '../viewmodels/seleccion_producto.dart';
import '../data/appcolors.dart';

/// Vista para la selección de productos.
/// Permite al usuario seleccionar productos y ajustar sus cantidades.
/// Devuelve los productos seleccionados al cerrar la vista.

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
      backgroundColor: AppColors.backgroundSlate,
      appBar: AppBar(
        title: const Text(
          "Elige productos",
          style: TextStyle(color: AppColors.textOnDark),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.textOnDark),
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
                  activeColor: AppColors.primary,
                  checkColor: AppColors.textOnDark,
                  value: estaSeleccionado,
                  onChanged: (_) => viewmodel.cambiarEstadoProducto(producto),
                ),
                title: Text(producto.nombre,
                    style: const TextStyle(color: AppColors.textOnLight)),
                subtitle: Text('${producto.precio.toStringAsFixed(2)} €',
                    style: const TextStyle(color: AppColors.textOnLight)),
                trailing: estaSeleccionado
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            color: AppColors.primary,
                            icon: const Icon(Icons.remove),
                            onPressed: () => viewmodel.disminuirCantidad(producto),
                          ),
                          Text('$cantidad',
                          style: const TextStyle(color: AppColors.textOnLight, fontSize: 16),),
                          IconButton(
                            color: AppColors.primary,
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
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.textOnDark,
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