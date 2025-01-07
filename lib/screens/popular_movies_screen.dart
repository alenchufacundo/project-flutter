import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config/api_config.dart';

class PopularMoviesScreen extends StatefulWidget {
  final Function(bool) onThemeChanged;

  const PopularMoviesScreen({super.key, required this.onThemeChanged});

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
    final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/puntuados'));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body); 
      setState(() {
        movies = decodedData['data'];
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
      appBar: AppBar(
        title: const Text('Películas Populares'),
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              // Cambia el tema usando el callback onThemeChanged
              widget.onThemeChanged(Theme.of(context).brightness != Brightness.dark);
            },
          ),
        ],
      ),
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
