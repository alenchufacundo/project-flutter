import 'package:flutter/material.dart';
import '../widgets/detail_populares.dart'; // Importa la nueva pantalla de detalles
import '../widgets/populares_detail.dart'; // Importa la nueva pantalla de detalles
import '../mocks/puntuados_mocks.dart'; // Datos mock

class PopularMoviesScreen extends StatelessWidget {
  final Function(bool) onThemeChanged;

  const PopularMoviesScreen({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColor = brightness == Brightness.dark ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas Populares'),
        backgroundColor: brightness == Brightness.dark ? Colors.black : Colors.cyan,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mockData.length,
        itemBuilder: (context, index) {
          final movie = mockData[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.cyan,
                child: Icon(Icons.movie, color: Colors.white),
              ),
              title: Text(
                movie['title'],
                style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Puntuación: ${movie['vote_average']} | Votos: ${movie['vote_count']}',
                style: TextStyle(color: textColor),
              ),
              onTap: () {
                // Navega a la pantalla de detalles de la película
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailScreen(movie: movie),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
