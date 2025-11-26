import 'package:flutter/material.dart';

class InputNombreMesa extends StatelessWidget {
  final Function(String) onChanged;

  const InputNombreMesa({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Introduce la mesa...',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.table_restaurant),
        ),
        onChanged: onChanged,
      ),
    );
  }
}