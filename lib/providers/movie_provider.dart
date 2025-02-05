import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_base/models/movie.dart';

class MovieProvider with ChangeNotifier {
  List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  Future<void> fetchMovies() async {
    final String apiUrl = dotenv.env['API_URL'] ?? '';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _movies = data.map((json) => Movie.fromJson(json)).toList();
        notifyListeners();
        saveMoviesToCache(response.body);
      } else {
        // Manejar el error, por ejemplo, lanzando una excepción
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      // Manejar el error, por ejemplo, mostrando un mensaje al usuario
      print('Error fetching movies: $e');
    }
  }

  Future<void> saveMoviesToCache(String jsonData) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('cached_movies', jsonData);
  }

  Future<void> loadMoviesFromCache() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString('cached_movies');
    if (cachedData != null) {
      final List<dynamic> data = json.decode(cachedData);
      _movies = data.map((json) => Movie.fromJson(json)).toList();
      notifyListeners();
    }
  }
}
