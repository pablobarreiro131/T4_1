import 'package:flutter/material.dart';
import '../../data/appcolors.dart';

/// Widget para introducir el nombre de la mesa.
/// Recibe una función onChanged que se llama cada vez que cambia el texto (setIdMesa).

class InputNombreMesa extends StatelessWidget {
  final Function(String) onChanged;

  const InputNombreMesa({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Introduce la mesa...',
          labelStyle: const TextStyle(color: AppColors.textOnLight),
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.table_restaurant, color: AppColors.textOnLight),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textOnLight),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 2),
          ),
        ),
        style: const TextStyle(color: AppColors.textOnLight),
        onChanged: onChanged,
      ),
    );
  }
}