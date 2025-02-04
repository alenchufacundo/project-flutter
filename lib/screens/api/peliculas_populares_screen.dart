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
        title: Text(
          'Películas Populares',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
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
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                          width: 120,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12), // Espacio entre imagen y texto
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              movie.overview,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
