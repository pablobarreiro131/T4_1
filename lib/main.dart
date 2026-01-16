import 'package:flutter/material.dart';
import 'views/home_view.dart';
import 'views/resumen_pedido_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bar',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Lora',
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontFamily: 'Jost', fontWeight: FontWeight.w600),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeView(),
        '/resumen': (context) => const ResumenPedidoView(),
      },
    );
  }
}