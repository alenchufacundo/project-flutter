import 'package:flutter/material.dart';
import 'package:flutter_application_base/helpers/preferences.dart';
import 'package:flutter_application_base/widgets/HoverProfile.dart';
import 'popular_movies_screen.dart';


// Estructura base para todas las pantallas
class BaseScreen extends StatelessWidget {
  final Widget body; // Contenido específico de la pantalla
  final Function(bool) onThemeChanged; // Función para el cambio de tema

  const BaseScreen({super.key, required this.body, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColor = brightness == Brightness.dark ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: brightness == Brightness.dark ? Colors.black : Colors.cyan,
        elevation: 0,
        title: const Text(
          'YOUFLIX',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: brightness == Brightness.dark ? Colors.black : Colors.cyan,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: brightness == Brightness.dark ? Colors.black54 : Colors.cyan,
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: Text(
                'Home',
                style: TextStyle(color: textColor),
              ),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(onThemeChanged: onThemeChanged),
                  ),
                  (route) => false, // Remueve todas las rutas anteriores
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: Text(
                'Settings',
                style: TextStyle(color: textColor),
              ),
              onTap: () {
                // Navega a la pantalla de configuración
              },
            ),
            ListTile(
              leading: const Icon(Icons.nightlight_round, color: Colors.white),
              title: Text(
                'Modo Oscuro',
                style: TextStyle(color: textColor),
              ),
              trailing: Switch(
                value: Preferences.darkmode,
                onChanged: onThemeChanged,
                activeColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}

// Pantalla principal (HomeScreen)
class HomeScreen extends StatelessWidget {
  final Function(bool) onThemeChanged;

  const HomeScreen({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColor = brightness == Brightness.dark ? Colors.white : Colors.black;

    final profiles = [
      {
        'image': 'https://via.placeholder.com/150/CCCCCC/FFFFFF?text=Películas+Populares',
        'name': 'Películas Populares',
        'screen': PopularMoviesScreen(onThemeChanged: onThemeChanged),
      },
      {
        'image': 'https://via.placeholder.com/150/CCCCCC/FFFFFF?text=Del+Momento',
        'name': 'Películas del Momento',
        'screen': TrendingMoviesScreen(onThemeChanged: onThemeChanged),
      },
      {
        'image': 'https://via.placeholder.com/150/CCCCCC/FFFFFF?text=Imágenes+Populares',
        'name': 'Imágenes Populares',
        'screen': PopularImagesScreen(onThemeChanged: onThemeChanged),
      },
      {
        'image': 'https://via.placeholder.com/150/CCCCCC/FFFFFF?text=Mejores+Actores',
        'name': 'Mejores Actores',
        'screen': BestActorsScreen(onThemeChanged: onThemeChanged),
      },
    ];

    return BaseScreen(
      onThemeChanged: onThemeChanged,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text(
            "¿Qué deseas explorar?",
            style: TextStyle(
              fontSize: 20,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1,
              ),
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                final profile = profiles[index];
                return HoverProfile(
                  image: profile['image'] as String,
                  name: profile['name'] as String,
                  textColor: textColor,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => profile['screen'] as Widget),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Pantallas individuales

class TrendingMoviesScreen extends StatelessWidget {
  final Function(bool) onThemeChanged;

  const TrendingMoviesScreen({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onThemeChanged: onThemeChanged,
      body: const Center(child: Text('Aquí van las películas del momento')),
    );
  }
}

class PopularImagesScreen extends StatelessWidget {
  final Function(bool) onThemeChanged;

  const PopularImagesScreen({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onThemeChanged: onThemeChanged,
      body: const Center(child: Text('Aquí van las imágenes populares')),
    );
  }
}

class BestActorsScreen extends StatelessWidget {
  final Function(bool) onThemeChanged;

  const BestActorsScreen({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onThemeChanged: onThemeChanged,
      body: const Center(child: Text('Aquí van los mejores actores')),
    );
  }
}
