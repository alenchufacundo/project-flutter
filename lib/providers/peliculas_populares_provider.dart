import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_base/models/peliculas_populares.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

// const API_URL = 'http://localhost:3000';

class PeliculasPopularesProvider with ChangeNotifier {
  final String? _baseUrl = dotenv.env['API_URL']; // Variable de entorno
  List<Movie> _popularMovies = [];

  List<Movie> get popularMovies => _popularMovies;

  Future<void> fetchPopularMovies() async {
    try {
      print("Fetching popular movies...");
      final response = await http.get(Uri.parse('$_baseUrl/popular'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic>? results = jsonData['data'];
        if (results != null) {
          _popularMovies =
              results.map((movie) => Movie.fromJson(movie)).toList();
          notifyListeners();
          // print("entro aca");
        } else {
          throw Exception('No data found');
        }
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching movies: $error');
      }
      throw error; // Propaga el error para que se pueda manejar en el FutureBuilder
    }
  }
}
