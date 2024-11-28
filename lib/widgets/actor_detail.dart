import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(  // Aseguramos que la pantalla sea desplazable si el contenido es largo
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,  // Centrado verticalmente
            crossAxisAlignment: CrossAxisAlignment.center,  // Centrado horizontalmente
            children: [
              // Imagen del actor centrada
              Center(
                child: CircleAvatar(
                  radius: 80,  // Hacemos la imagen un poco más grande
                  backgroundImage: NetworkImage(actor['image']),
                ),
              ),
              const SizedBox(height: 16),
              // Nombre del actor
              Text(
                actor['name'],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 8),
              // Descripción del actor
              Text(
                actor['description'],
                style: TextStyle(fontSize: 16, color: textColor),
                textAlign: TextAlign.center,  // Alineamos la descripción al centro
              ),
              const SizedBox(height: 16),
              // Título de películas
              Text(
                'Películas:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 8),
              // Grid de películas (centrado)
              GridView.builder(
                shrinkWrap: true, // Para que el GridView no ocupe espacio infinito
                physics: NeverScrollableScrollPhysics(), // Evitar desplazamiento dentro del GridView
                padding: const EdgeInsets.symmetric(vertical: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 2,
                ),
                itemCount: actor['movies'].length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          actor['movies'][index],
                          style: TextStyle(color: textColor),
                          textAlign: TextAlign.center,  // Centrado de texto en la tarjeta
                        ),
                      ),
                    ),
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
