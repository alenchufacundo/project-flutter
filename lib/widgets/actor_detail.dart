import 'package:flutter/material.dart';
import 'animated_card.dart'; // Asegúrate de importar el archivo del widget

class ActorDetailScreen extends StatelessWidget {
  final Map<String, dynamic> actor;

  const ActorDetailScreen({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColor = brightness == Brightness.dark ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text(actor['name']),
        backgroundColor: brightness == Brightness.dark ? Colors.black : Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(actor['image']),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                actor['name'],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                actor['description'],
                style: TextStyle(fontSize: 16, color: textColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Películas:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 2,
                ),
                itemCount: actor['movies'].length,
                itemBuilder: (context, index) {
                  return AnimatedCard(
                    movieTitle: actor['movies'][index],
                    textColor: textColor,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
