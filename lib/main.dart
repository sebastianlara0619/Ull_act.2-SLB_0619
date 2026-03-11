import 'package:flutter/material.dart';

// 1. Clase Producto
class Producto {
  final String titulo;
  final String subtitulo;
  final String imgUrl;

  Producto({
    required this.titulo,
    required this.subtitulo,
    required this.imgUrl,
  });
}

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Lista de datos (Simulando diccionarios convertidos a objetos Producto)
    final List<Map<String, String>> datosCrudos = <Map<String, String>>[
      {
        'titulo': 'Diseño Minimalista',
        'subtitulo': 'Explora la belleza de lo simple.',
        'imgUrl': 'https://raw.githubusercontent.com/sebastianlara0619/Im-genes-act.12/refs/heads/main/download.jpg'
      },
      {
        'titulo': 'Nuevos Horizontes',
        'subtitulo': 'Descubre colores vibrantes hoy.',
        'imgUrl': 'https://raw.githubusercontent.com/sebastianlara0619/Im-genes-act.12/refs/heads/main/descarga.jfif'
      },
      {
        'titulo': 'Estilo Moderno',
        'subtitulo': 'La guía definitiva de Flutter.',
        'imgUrl': 'https://picsum.photos/id/40/200'
      },
    ];

    // Convertimos la lista de mapas en una lista de objetos Producto
    final List<Producto> productos = datosCrudos.map<Producto>((Map<String, String> item) {
      return Producto(
        titulo: item['titulo']!,
        subtitulo: item['subtitulo']!,
        imgUrl: item['imgUrl']!,
      );
    }).toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF3E5F5), // Fondo morado muy claro
        appBar: AppBar(
          title: const Text('Mis Tarjetas Pastel'),
          backgroundColor: const Color(0xFFB39DDB), // Morado pastel
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          // 3. Columna Principal
          child: SingleChildScrollView( // Added to prevent overflow if cards exceed screen height
            child: Column(
              children: productos.map<Widget>((Producto prod) => TarjetaProducto(producto: prod)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

// 4. Widget personalizado para la Tarjeta
class TarjetaProducto extends StatelessWidget {
  final Producto producto;

  const TarjetaProducto({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Sombreado
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [Color(0xFFE1F5FE), Color(0xFFF3E5F5)], // Degradado Azul a Morado pastel
          ),
        ),
        child: Row( // Fila dentro de la tarjeta
          children: <Widget>[
            // Imagen desde la red
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                producto.imgUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16), // Espacio entre imagen y texto
            // Columna a la derecha con los textos
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Alineación a la izquierda
                children: <Widget>[
                  Text(
                    producto.titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      // FIX: Corrected invalid color format
                      color: Color(0xFF616161),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    producto.subtitulo,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}