import 'package:flutter/material.dart';

class MovieDetailScreen extends StatefulWidget {
  final Map<String, dynamic> movie; // Recibe los datos de la película

  const MovieDetailScreen({super.key, required this.movie});

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  double _rating = 0; // Calificación inicial de 0

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColor = brightness == Brightness.dark
        ? const Color.fromARGB(255, 0, 0, 0)
        : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.movie['title'], // Título de la película
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:
            brightness == Brightness.dark ? Colors.black : Colors.cyan,
      ),
      body: Stack(
        children: [
          // Fondo de la película
          Positioned.fill(
            child: Image.asset(
              widget.movie['imageUrl'], // Imagen de fondo
              fit: BoxFit.cover,
            ),
          ),
          // Contenido encima del fondo
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.9),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sinopsis de la película
                    Text(
                      'Sinopsis: ${widget.movie['synopsis']}',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    // Año de la película
                    Text(
                      'Año: ${widget.movie['year']}',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    // Género de la película
                    Text(
                      'Género: ${widget.movie['genre']}',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    // Espacio para comentarios
                    Text(
                      'Escribe un comentario:',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    // Textfield para ingresar el comentario
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            maxLines: 1,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "Escribe tu comentario",
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Botón para enviar comentario
                        ElevatedButton(
                          onPressed: () {
                            // Aquí va la lógica para enviar el comentario
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.cyan),
                          ),
                          child: const Text("Enviar"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Estrellas interactivas para la calificación
                    Text(
                      'Calificación:',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _rating =
                                  index + 1.0; // Actualiza la calificación
                            });
                          },
                          child: Icon(
                            index < _rating ? Icons.star : Icons.star_border,
                            color: Colors.yellow,
                            size: 40,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
