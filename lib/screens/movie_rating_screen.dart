import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config/api_config.dart';

class MovieRatingScreen extends StatefulWidget {
  final int movieId;

  const MovieRatingScreen({super.key, required this.movieId});

  @override
  State<MovieRatingScreen> createState() => _MovieRatingScreenState();
}

class _MovieRatingScreenState extends State<MovieRatingScreen> {
  Map<String, dynamic>? movieDetails;
  bool isLoading = true;
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchMovieDetails();
  }

  Future<void> fetchMovieDetails() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiConfig.baseUrl}/puntuados/${widget.movieId}'),
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
          ],
        ),
      ),
    );
  }
}
