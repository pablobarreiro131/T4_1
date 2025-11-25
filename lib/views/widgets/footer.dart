import 'package:flutter/material.dart';

class FooterAcciones extends StatelessWidget {
  final double total;
  final bool esValido;
  final VoidCallback onGuardar;
  final VoidCallback onCancelar;

  const FooterAcciones({
    super.key,
    required this.total,
    required this.esValido,
    required this.onGuardar,
    required this.onCancelar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'TOTAL:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '${total.toStringAsFixed(2)} €',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onCancelar,
                  child: const Text('Cancelar'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton(
                  onPressed: esValido ? onGuardar : null,
                  child: const Text('GUARDAR PEDIDO'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
