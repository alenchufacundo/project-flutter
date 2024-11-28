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
        title: const Text('Clasicos del Cine'),
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
                    builder: (context) => ClassicScreen(movie: movie),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }}
