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
    _controller.text = personalNote;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;
    final brightness = Theme.of(context).brightness;

    // Usamos blanco como color de texto para mayor contraste
    final textColor = Colors.white; 

    final imageUrl = movie['image_url']; 

    return Scaffold(
      appBar: AppBar(
        title: Text(movie['title']),
        backgroundColor: brightness == Brightness.dark ? Colors.black : Colors.cyan,
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover, 
            ),
          ),
          
          
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.2), 
            ),
          ),

          // Contenido encima de la imagen
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                // Título de la película
                SizedBox(height: 16),
                Text(
                  movie['title'],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: textColor, 
                  ),
                ),
                SizedBox(height: 8),
                
                // Puntuación y votos
                Text(
                  'Puntuación: ${movie['vote_average']} | Votos: ${movie['vote_count']}',
                  style: TextStyle(fontSize: 16, color: textColor),
                ),
                SizedBox(height: 8),

                // Año y Género
                Text(
                  'Año: ${movie['year']} | Género: ${movie['genre']}',
                  style: TextStyle(fontSize: 16, color: textColor),
                ),
                SizedBox(height: 16),

                // Descripción de la película
                Text(
                  'Descripción:',
                  style: TextStyle(fontSize: 18, color: textColor),
                ),
                SizedBox(height: 8),
                Text(
                  movie['description'],
                  style: TextStyle(fontSize: 16, color: textColor),
                ),
                SizedBox(height: 16),

                // Switch para marcar como favorita
                Row(
                  children: [
                    Text(
                      '¿Es tu favorita?',
                      style: TextStyle(fontSize: 18, color: textColor),
                    ),
                    Switch(
                      value: isFavorite,
                      onChanged: (bool value) {
                        setState(() {
                          isFavorite = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Campo de texto para dejar una nota personal
                Text(
                  'Nota personal sobre la película:',
                  style: TextStyle(fontSize: 18, color: textColor),
                ),
                TextFormField(
                  controller: _controller,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Escribe tu comentario...',
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.grey[400]), // Sugerencia de texto más clara
                  ),
                  onChanged: (value) {
                    setState(() {
                      personalNote = value;
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
