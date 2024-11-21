import 'package:flutter/material.dart';
import 'package:flutter_application_base/helpers/preferences.dart';

class HomeScreen extends StatelessWidget {
  final Function(bool) onThemeChanged;  // Función que se ejecuta cuando cambia el tema

  const HomeScreen({super.key, required this.onThemeChanged});  // Recibe la función de cambio de tema

  @override
  Widget build(BuildContext context) {
    // Determinar si el tema es claro u oscuro
    final brightness = Theme.of(context).brightness;

    // Si el tema es claro, el fondo será blanco, si es oscuro será negro
    final backgroundColor = brightness == Brightness.dark ? Colors.black : Colors.white;

    // Determinar el color del texto según el tema
    final textColor = brightness == Brightness.dark ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Netflix',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
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
                style: TextStyle(color: textColor), // Cambiar el color según el tema
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: Text(
                'Settings',
                style: TextStyle(color: textColor), // Cambiar el color según el tema
              ),
              onTap: () {
                // Navega a la pantalla de configuración
              },
            ),
            ListTile(
              leading: const Icon(Icons.nightlight_round, color: Colors.white),
              title: Text(
                'Modo Oscuro',
                style: TextStyle(color: textColor), // Cambiar el color según el tema
              ),
              trailing: Switch(
                value: Preferences.darkmode,
                onChanged: onThemeChanged, // Cambia el tema cuando se mueve el switch
                activeColor: Colors.red,  // Color del switch cuando está activado
              ),
              onTap: () {
                // Puedes manejar una acción al hacer clic en el tile si es necesario
              },
            ),
          ],
        ),
      ),
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text(
            "¿Quién está viendo?",
            style: TextStyle(
              fontSize: 20,
              color: textColor,  // Cambiar el color del texto según el tema
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
                childAspectRatio: 1, // Relación de aspecto cuadrada
              ),
              itemCount: 4, // Número de perfiles
              itemBuilder: (context, index) {
                return HoverProfile(
                  image: 'https://via.placeholder.com/282/CCCCCC/FFFFFF?text=Default',  // Imagen predeterminada
                  name: 'Perfil ${index + 1}',
                  textColor: textColor,  // Pasamos el color del texto a HoverProfile
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HoverProfile extends StatefulWidget {
  final String image;
  final String name;
  final Color textColor;  // Color del texto para que se adapte al tema

  const HoverProfile({Key? key, required this.image, required this.name, required this.textColor})
      : super(key: key);

  @override
  State<HoverProfile> createState() => _HoverProfileState();
}

class _HoverProfileState extends State<HoverProfile>
    with SingleTickerProviderStateMixin {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Acción al seleccionar el perfil
      },
      child: MouseRegion(
        onEnter: (_) => setState(() {
          _hovering = true;
        }),
        onExit: (_) => setState(() {
          _hovering = false;
        }),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: _hovering
                    ? [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.8),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ]
                    : [],
              ),
              child: CircleAvatar(
                radius: 40, // Tamaño más pequeño
                backgroundImage: NetworkImage(widget.image),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.name,
              style: TextStyle(
                color: widget.textColor, // Usar el color adecuado del texto
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
