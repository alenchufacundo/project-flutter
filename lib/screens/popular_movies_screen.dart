import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PopularMoviesScreen extends StatefulWidget {
  final Function onThemeChanged; // Declaramos el parámetro onThemeChanged

  // Constructor que acepta el parámetro onThemeChanged
  PopularMoviesScreen({required this.onThemeChanged});

  @override
  _PopularMoviesScreenState createState() => _PopularMoviesScreenState();
}

class _PopularMoviesScreenState extends State<PopularMoviesScreen> {
  List<dynamic> movies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/puntuados'));
      if (response.statusCode == 200) {
        setState(() {
          movies = json.decode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception('Error al cargar las películas populares');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Películas Populares')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return ListTile(
                  title: Text(movie['title']),
                  subtitle: Text('Puntuación: ${movie['vote_average']}'),
                );
              },
            ),
    );
  }
}
