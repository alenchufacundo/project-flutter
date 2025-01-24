import 'package:flutter/material.dart';
import 'package:flutter_application_base/providers/peliculas_populares_provider.dart';
import 'package:provider/provider.dart';

class PeliculasPopularesScreen extends StatefulWidget {
  const PeliculasPopularesScreen({super.key});

  @override
  _PeliculasPopularesScreenState createState() =>
      _PeliculasPopularesScreenState();
}

class _PeliculasPopularesScreenState extends State<PeliculasPopularesScreen> {
  @override
  void initState() {
    super.initState();
    // Llamar solo una vez cuando la pantalla se inicializa
    Provider.of<PeliculasPopularesProvider>(context, listen: false)
        .fetchPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<PeliculasPopularesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Películas Populares'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Flecha de retroceso
          onPressed: () {
            Navigator.pop(context); // Navega hacia atrás
          },
        ),
      ),
      body: movieProvider.popularMovies.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: movieProvider.popularMovies.length,
              itemBuilder: (context, index) {
                final movie = movieProvider.popularMovies[index];
                return ListTile(
                  leading: Image.network(
                      'https://image.tmdb.org/t/p/w200${movie.posterPath}'),
                  title: Text(movie.title),
                  subtitle: Text(movie.overview),
                );
              },
            ),
    );
  }
}
