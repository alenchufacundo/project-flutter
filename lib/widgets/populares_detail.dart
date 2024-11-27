import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  final Map<String, dynamic> movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColor = brightness == Brightness.dark ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie['title']),
        backgroundColor: brightness == Brightness.dark ? Colors.black : Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Título: ${movie['title']}',
              style: TextStyle(color: textColor, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Puntuación: ${movie['vote_average']}',
              style: TextStyle(color: textColor, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Votos: ${movie['vote_count']}',
              style: TextStyle(color: textColor, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
