import 'package:flutter/material.dart';

class MovieDetailScreen extends StatefulWidget {
  final Map<String, dynamic> movie; // Recibe los datos de la película

  const MovieDetailScreen({super.key, required this.movie});

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  double _rating = 0; // Calificación inicial de 0
  TextEditingController _commentController =
      TextEditingController(); // Controlador para el comentario

  // Función para simular el envío del comentario
  void _sendComment() {
    if (_commentController.text.isNotEmpty) {
      // Mostrar un Snackbar indicando que el comentario se ha enviado
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Comentario enviado')),
      );

      // Limpiar el campo de texto
      _commentController.clear();

      // Limpiar la calificación
      setState(() {
        _rating = 0;
      });
    } else {
      // Si no se ha escrito un comentario, muestra un mensaje de advertencia
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, escribe un comentario')),
      );
    }
  }

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
                            controller:
                                _commentController, // Asigna el controlador al TextField
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
                          onPressed:
                              _sendComment, // Llama a la función _sendComment
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
