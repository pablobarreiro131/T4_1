import 'package:flutter/material.dart';

class FooterAcciones extends StatelessWidget {
  final double total;
  final bool esValido;
  final VoidCallback onGuardar;
  final VoidCallback onCancelar;
  final VoidCallback onVerResumen;

  const FooterAcciones({
    super.key,
    required this.total,
    required this.esValido,
    required this.onGuardar,
    required this.onCancelar,
    required this.onVerResumen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Total: ${total.toStringAsFixed(2)} €'),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onCancelar,
                  child: const Text('Cancelar'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: esValido ? onVerResumen : null,
                  child: const Text('Ver Resumen'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: esValido ? onGuardar : null,
                  child: const Text('Guardar'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}