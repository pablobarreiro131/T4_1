# Sistema de Gestión de Comandas - Flutter

Aplicación de gestión de pedidos para restaurante/bar desarrollada en Flutter, que permite crear comandas, seleccionar productos y visualizar resúmenes en formato ticket.

## Descripción del Proyecto

Aplicación móvil/multiplataforma que facilita la gestión de comandas en establecimientos de hostelería. Permite:
- Visualizar todos los pedidos activos
- Crear nuevos pedidos asignados a mesas
- Seleccionar productos y cantidad
- Diseño de las card con forma de ticket

## Arquitectura y Patrones

### Patrón MVVM
El proyecto implementa el patrón Model-View-ViewModel con separación clara de responsabilidades:
- **Models** (`lib/models/`): Entidades de datos (Pedido, Producto)
- **Views** (`lib/views/`): Interfaz de usuario
- **ViewModels** (`lib/viewmodels/`): Lógica de negocio y estado

### Gestión de Estado
- `ChangeNotifier` para gestión de estado reactivo
- `ListenableBuilder` para actualización automática de la UI
- Patrón Observer para notificación de cambios

## Estructura del Proyecto

```
lib/
├── models/          # Modelos de datos (Pedido, Producto)
├── viewmodels/      # Lógica de negocio
│   ├── home.dart
│   ├── crear_pedido.dart
│   └── seleccion_producto.dart
├── views/           # Pantallas principales
│   ├── home_view.dart
│   ├── crear_pedido_view.dart
│   ├── seleccion_producto_view.dart
│   ├── resumen_pedido_view.dart
│   └── widgets/     # Componentes reutilizables
├── data/            # Datos mock y constantes (AppColors)
└── resources/       # Clippers personalizados
```

## Funcionalidades Principales

### 1. Listado de Pedidos (Home)
- Vista principal con todos los pedidos activos
- Tarjetas con información de mesa, productos y total
- Botón flotante para crear nuevos pedidos

### 2. Crear Pedido
- Input para identificación de mesa
- Selección de productos
- Validación antes de confirmar
- Navegación al resumen tras crear

### 3. Selección de Productos
- Lista interactiva de productos disponibles
- Control de cantidad con botones +/-
- Cálculo automático de subtotales
- Footer con total acumulado

### 4. Resumen de Pedido (Ticket)
- Vista estilo ticket de compra
- Efectos visuales de papel con bordes dentados
- Desglose de productos y cantidades
- Total del pedido

## Sistema de Colores

Paleta personalizada definida en `AppColors`:

- **Primary**: `#006D77` - Verde azulado
- **Accent**: `#FF9F87` - Coral
- **Background**: `#FFF7EB` - Beige
- **Ticket Paper**: `#FFFFFF` - Blanco
- **Ticket Background**: `#F5F5F5` - Gris claro

## Características Técnicas

### Custom Clippers
Efectos visuales personalizados para bordes dentados de tickets:
- `RecorteInferiorClipper`: Borde dentado inferior
- `RecorteDerechoClipper`: Borde dentado derecho
- `RecorteSuperiorClipper`: Borde dentado superior

### Navegación
- Sistema de rutas con `Navigator.push`
- Paso de argumentos entre pantallas
- Retorno de datos mediante `Navigator.pop`

### Diseño Responsive
- Uso de `Expanded` y `Flexible`
- Layout con `Column`, `Row` y `ListView`
- Constraints adaptables a diferentes tamaños

## Modelos de Datos

### Producto
```dart
class Producto {
  final int id;
  final String nombre;
  final double precio;
}
```

### Pedido
```dart
class Pedido {
  final int id;
  final String idMesa;
  final Map<Producto, int> productos;
  
  double get total;      // Calcula precio total
  int get totalItems;    // Cuenta productos totales
}
```

## ViewModels

### HomeViewModel
- Gestión de lista de pedidos
- Datos mock iniciales (3 pedidos de ejemplo)
- Métodos para agregar nuevos pedidos

### CrearPedido
- Validación de ID de mesa
- Gestión de productos seleccionados
- Creación de nuevos pedidos
- Generación de IDs únicos

### SeleccionProducto
- Control de productos seleccionados
- Gestión de cantidades
- Cálculo de totales parciales

## Componentes Reutilizables

- **InputNombreMesa**: TextField personalizado para mesa
- **ListaProductosSeleccionados**: Lista con subtotales
- **FooterAcciones**: Botones de acción con total a pagar

## Plataformas Soportadas

- Android
- Web

## Instalación y Ejecución

### Requisitos Previos
- Flutter SDK (3.35.5)
- Dart SDK (3.9.2)
- IDE (VS Code, Android Studio, etc.)

### Pasos
```bash
# Clonar el repositorio
git clone <url-del-repositorio>

# Navegar al directorio
cd t4_1

# Instalar dependencias
flutter pub get

# Ejecutar la aplicación
flutter run
```

## Dependencias

- Flutter SDK
- Material Design 3
- Fuentes personalizadas:
  - **Lora**: Texto general
  - **Jost**: Títulos y encabezados

## Flujo de Navegación

```
HomeView (Lista de pedidos)
    ↓
CrearPedidoView (Asignar mesa)
    ↓
SeleccionProductoView (Elegir productos)
    ↓
CrearPedidoView (Confirmar)
    ↓
ResumenPedidoView (Ticket)
    ↓
HomeView (Actualizado)
```

## Posibles Mejoras Futuras

- Persistencia de datos (SQLite, Hive)
- Sincronización con backend
- Impresión de tickets
- Gestión de mesas gráfica
- Estadísticas y reportes
- Autenticación de usuarios
- Categorías de productos
- Descuentos y promociones


Pablo Barreiro Iglesias, 2026.
