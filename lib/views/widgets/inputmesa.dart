import 'package:flutter/material.dart';

class InputNombreMesa extends StatelessWidget {
  final Function(String) onChanged;

  const InputNombreMesa({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Mesa o Nombre del Cliente',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.table_restaurant),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
