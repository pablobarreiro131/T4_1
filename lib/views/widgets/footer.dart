import 'package:flutter/material.dart';
import '../../data/appcolors.dart';
import '../../resources/clippers.dart';

/// Widget de pie de página que muestra el total y acciones para guardar, cancelar o ver el resumen del pedido.
/// Recibe el total, si el pedido es válido y callbacks para las acciones.

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
    return PhysicalShape(
      color: AppColors.ticketPaper,
      clipper: RecorteSuperiorClipper(),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TOTAL A PAGAR:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.textOnLight,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 6.0,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      '${total.toStringAsFixed(2)} €',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textOnDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
            children: [
              Expanded(
                flex: 2,
                child: ElevatedButton.icon(
                  onPressed: onCancelar,
                  icon: const Icon(Icons.close, size: 20),
                  label: const Text(
                    'Cancelar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.error,
                    foregroundColor: AppColors.textOnDark,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: ElevatedButton.icon(
                  onPressed: esValido ? onVerResumen : null,
                  icon: const Icon(Icons.receipt_long, size: 20),
                  label: const Text(
                    'Ver Resumen',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.textOnDark,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      disabledBackgroundColor: AppColors.textOnDark,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: esValido ? onGuardar : null,
                icon: const Icon(Icons.check_circle, size: 22),
                label: const Text(
                  'Guardar Pedido',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success,
                  foregroundColor: AppColors.textOnDark,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  disabledBackgroundColor: AppColors.textOnDark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}