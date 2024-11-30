import 'package:flutter/material.dart';
import 'package:flutter_application_base/widgets/detail_classic.dart';

import '../mocks/classic_mocks.dart';

class ClassicMoviesScreen extends StatelessWidget {
  final Function(bool) onThemeChanged;

  const ClassicMoviesScreen({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColor = brightness == Brightness.dark ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clásicos del Cine'),
        backgroundColor: brightness == Brightness.dark ? Colors.black : Colors.cyan,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mockData.length,
        itemBuilder: (context, index) {
          final movie = mockData[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), 
            ),
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: Colors.cyan,
                child: Icon(Icons.movie, color: Colors.white),
              ),
              title: Text(
                movie['title'],
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18, 
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Puntuación: ${movie['vote_average']} | Votos: ${movie['vote_count']}',
                    style: TextStyle(color: textColor, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Año: ${movie['year']} | Género: ${movie['genre']}',
                    style: TextStyle(color: textColor, fontSize: 14),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClassicScreen(movie: movie),
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
