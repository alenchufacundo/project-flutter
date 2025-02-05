import 'package:flutter/material.dart';
import 'package:flutter_application_base/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class TopRatedMoviesScreen extends StatelessWidget {
  final Function(bool) onThemeChanged;

  const TopRatedMoviesScreen({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Puntuadas Top')),
      body: Consumer<MovieProvider>(
        builder: (context, provider, child) {
          return FutureBuilder(
            future: provider.fetchMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (provider.puntuadosMovies.isEmpty) {
                return const Center(child: Text('No hay películas disponibles'));
              } else {
                final movies = provider.puntuadosMovies;
                return ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return ListTile(
                      leading: Image.network(
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(movie.title),
                      subtitle: Text('Votos: ${movie.voteCount}'),
                      trailing: Text('⭐ ${movie.voteAverage}'),
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}