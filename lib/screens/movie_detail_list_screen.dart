import 'package:flutter/material.dart';
import '../mocks/mock_movies.dart'; // Importa los mock movies
import 'movie_detail_screen.dart'; // Importa la pantalla de detalles

class MovieDetailListScreen extends StatelessWidget {
  final Function(bool) onThemeChanged; // Añadimos este parámetro

  const MovieDetailListScreen(
      {super.key,
      required this.onThemeChanged}); // Lo recibimos en el constructor

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColor =
        brightness == Brightness.dark ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Películas"),
        backgroundColor:
            brightness == Brightness.dark ? Colors.black : Colors.cyan,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mockData.length,
        itemBuilder: (context, index) {
          final movie = mockData[index]; // Obtiene la película de la lista

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(movie[
                    'imageUrl']), // Asegura que la imagen se vea correctamente
              ),
              title: Text(
                movie['title'], // Solo muestra el título
                style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
              ),
              // Eliminamos el 'subtitle' para no mostrar puntuación ni votos
              onTap: () {
                // Navega a la pantalla de detalles de la película
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailScreen(
                        movie:
                            movie), // Aquí ya pasas la película a la pantalla de detalle
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
