import 'dart:ui';

import 'package:flutter/material.dart';

class ClassicScreen extends StatefulWidget {
  final Map<String, dynamic> movie;

  const ClassicScreen({super.key, required this.movie});

  @override
  _ClassicScreenState createState() => _ClassicScreenState();
}

class _ClassicScreenState extends State<ClassicScreen> {
  bool isFavorite = false;
  String personalNote = '';

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicializamos el controlador con la nota personal actual
    _controller.text = personalNote;
  }

  @override
  void dispose() {
    _controller.dispose(); // No olvides liberar el controlador
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie; // Accedemos a la información de la película
    final brightness = Theme.of(context).brightness;
    final textColor =
        brightness == Brightness.dark ? Colors.white : Colors.black;

    // Obtenemos la URL de la imagen local
    final imageUrl =
        movie['image_url']; // e.g., 'assets/images/movie_image.jpg'

    return Scaffold(
      appBar: AppBar(
        title: Text(movie['title']),
        backgroundColor:
            brightness == Brightness.dark ? Colors.black : Colors.cyan,
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              imageUrl, // Usamos la ruta local de la imagen
              fit: BoxFit.cover, // Asegúrate de cubrir toda la pantalla
            ),
          ),

           // Aplicamos el filtro de desenfoque (blur)
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0), // Desenfoque de la imagen
              child: Container(
                color: Colors.black.withOpacity(0.3), // Añadimos opacidad para oscurecer un poco el fondo
              ),
            ),
          ),

          // Contenido encima de la imagen
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                // Aquí va el contenido que se sobrepone a la imagen de fondo
                SizedBox(height: 16),
                Text(
                  movie['title'],
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                ),
                SizedBox(height: 8),
                Text(
                  'Puntuación: ${movie['vote_average']} | Votos: ${movie['vote_count']}',
                  style: TextStyle(fontSize: 16, color: textColor),
                ),
                SizedBox(height: 16),
                // Switch para marcar como favorita
                Row(
                  children: [
                    Text('¿Es tu favorita?',
                        style: TextStyle(fontSize: 18, color: textColor)),
                    Switch(
                      value: isFavorite,
                      onChanged: (bool value) {
                        setState(() {
                          isFavorite =
                              value; // Cambiar el estado de la película favorita
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // Campo de texto para que el usuario deje una nota personal
                Text('Nota personal sobre la película:',
                    style: TextStyle(fontSize: 18, color: textColor)),
                TextFormField(
                  controller: _controller,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Escribe tu comentario...',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      personalNote =
                          value; // Cambiar la nota personal cuando el usuario escriba
                    });
                  },
                ),
                SizedBox(height: 16),
                // Botón para guardar cambios
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Cambios guardados!')));
                  },
                  child: const Text('Guardar Cambios'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
