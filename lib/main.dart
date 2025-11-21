import 'package:flutter/material.dart';
import 'package:t4_1/views/resumen_pedido_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Scaffold(
        body: Center(
          child: Text('Home'),
        ),
      ),
      routes: {
        '/resumen': (context) => const ResumenPedidoView(),
      },
    );
  }
}
