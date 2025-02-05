import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_base/models/movie.dart';


class MovieProvider with ChangeNotifier {
  final String? _baseUrl = dotenv.env['API_URL'];
  List<Movie> _puntuadosMovies = [];
  bool _isLoaded = false;

  List<Movie> get puntuadosMovies => _puntuadosMovies;

  Future<void> fetchMovies() async {
    if (_isLoaded) return;

    try {
      print("Fetching top Rated movies...");
      final response = await http.get(Uri.parse('$_baseUrl/puntuados'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic>? results = jsonData['data'];
        if (results != null) {
          _puntuadosMovies =
              results.map((movie) => Movie.fromJson(movie)).toList();
          _isLoaded = true;
          notifyListeners();
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
      throw error;
    }
  }
}
