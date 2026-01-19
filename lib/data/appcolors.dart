import 'package:flutter/material.dart';

/// Clase que define los colores utilizados en la aplicación.
/// Contiene colores primarios, de acento, de fondo, de texto y otros colores específicos para diferentes elementos de la interfaz de usuario.
/// Cada color está definido como una constante estática para facilitar su uso en cualquier parte del código.
/// Por ejemplo, `primary` es el color principal de la aplicación, `accent` es un color de acento utilizado para resaltar elementos importantes, y `backgroundSlate` es el color de fondo general de la aplicación.
/// Otros colores son `ticketPaper` para el fondo de los tickets, `textOnDark` y `textOnLight` para el texto en fondos oscuros y claros, colores para indicar éxito y error...
/// También se incluyen versiones transparentes de los colores primarios y de acento para efectos visuales.

class AppColors {
  static const Color primary = Color(0xFF006D77); 
  static const Color accent = Color(0xFFFF9F87); 
  static const Color backgroundSlate = Color(0xFFFFF7EB); 
  static const Color ticketPaper = Color(0xFFFFFFFF); 
  static const Color textOnDark = Color(0xFFEDF6F9);
  static const Color textOnLight = Color(0xFF2B2D42);
  static const Color success = Color(0xFF83C5BE);
  static const Color error = Color.fromARGB(255, 226, 124, 120);
  static const Color textBlack = Color(0xFF1D1D1D);
  static const Color primaryTransparent = Color(0x80006D77);
  static const Color accentTransparent = Color(0x80FF9F87);  
}