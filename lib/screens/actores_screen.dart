import 'package:flutter/material.dart';
import 'package:flutter_application_base/screens/home_screen.dart';
import '../mocks/actores.dart'; // Archivo donde están los datos mock
import '../widgets/actor_card.dart'; // Widget reutilizable para cada actor
import '../widgets/actor_detail.dart'; // Pantalla de detalles del actor

class ActorsScreen extends StatefulWidget {
  final Function(bool) onThemeChanged;

  const ActorsScreen({super.key, required this.onThemeChanged});

  @override
  _ActorsScreenState createState() => _ActorsScreenState();
}

class _ActorsScreenState extends State<ActorsScreen> {
  String searchQuery = '';
  List<Map<String, dynamic>> filteredActors = [];

  @override
  void initState() {
    super.initState();
    // Inicializamos la lista filtrada con todos los actores
    filteredActors = actors;
  }

  // Función para actualizar el filtro
  void filterActors() {
    setState(() {
      filteredActors = actors.where((actor) {
        final actorName = actor['name'].toLowerCase();
        final actorMovies = actor['movies'].join(' ').toLowerCase();
        final queryLower = searchQuery.toLowerCase();

        return actorName.contains(queryLower) ||
            actorMovies.contains(queryLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColor =
        brightness == Brightness.dark ? Colors.white : Colors.black;

    return BaseScreen(
      onThemeChanged: widget.onThemeChanged,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Buscar Actor/Película',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    filterActors(); // Aplicar filtro cuando se presiona el botón
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredActors.length,
              itemBuilder: (context, index) {
                final actor = filteredActors[index];
                return ActorCard(
                  actor: actor,
                  textColor: textColor,
                  onTap: () {
                    // Navegar a la pantalla de detalles del actor
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActorDetailScreen(actor: actor),
                      ),
                    ).then((_) {
                      // Esto se ejecutará cuando regreses de la pantalla de detalles
                      setState(() {
                        // Restablecer la búsqueda y mostrar todos los actores
                        searchQuery = '';
                        filteredActors = actors;
                      });
                    });
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
