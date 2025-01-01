import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieRatingScreen extends StatefulWidget {
  final int movieId; // Ahora solo recibimos el ID de la película.

  const MovieRatingScreen({super.key, required this.movieId});

  @override
  State<MovieRatingScreen> createState() => _MovieRatingScreenState();
}

class _MovieRatingScreenState extends State<MovieRatingScreen> {
  Map<String, dynamic>? movieDetails; // Detalles de la película.
  bool isLoading = true;
  double _userRating = 0; // Puntuación del usuario.
  final TextEditingController _commentController = TextEditingController(); // Controlador del comentario.

  @override
  void initState() {
    super.initState();
    fetchMovieDetails();
  }

  Future<void> fetchMovieDetails() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:3000/puntuados/${widget.movieId}'),
      );
      if (response.statusCode == 200) {
        setState(() {
          movieDetails = json.decode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception('Error al cargar los detalles de la película');
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> enviarComentario(String comentario) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/puntuados/${widget.movieId}/comentarios'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({'comentario': comentario}),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Comentario enviado con éxito')),
        );
        _commentController.clear();
      } else {
        throw Exception('Error al enviar el comentario');
      }
    } catch (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al enviar el comentario')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(movieDetails!['title']),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movieDetails!['title'],
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text('Puntuación: ${movieDetails!['vote_average']}'),
              const SizedBox(height: 32),
              Text(
                '¿Cuánto te gustó esta película?',
                style: const TextStyle(fontSize: 20),
              ),
              Slider(
                value: _userRating,
                min: 0,
                max: 10,
                divisions: 10,
                label: _userRating.toString(),
                onChanged: (value) {
                  setState(() {
                    _userRating = value;
                  });
                },
              ),
              Text('Tu puntuación: ${_userRating.toStringAsFixed(1)}'),
              const SizedBox(height: 32),
              TextField(
                controller: _commentController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Escribe tu comentario...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final comentario = _commentController.text;
                  if (comentario.isNotEmpty) {
                    enviarComentario(comentario);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('El comentario no puede estar vacío'),
                      ),
                    );
                  }
                },
                child: const Text('Enviar Comentario'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
