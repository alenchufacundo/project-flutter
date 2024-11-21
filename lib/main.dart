import 'package:flutter/material.dart';
import 'package:flutter_application_base/helpers/preferences.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initShared();  // Inicializa SharedPreferences.
  runApp(MyApp());  // Ejecuta la aplicación
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    // Recuperamos la preferencia de tema desde SharedPreferences
    _isDarkMode = Preferences.darkmode;
  }

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value; // Actualiza el estado del tema
      Preferences.darkmode = value; // Guarda el nuevo estado en SharedPreferences
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      darkTheme: ThemeData.dark(),  // Tema oscuro
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light, // Aplica el tema basado en el valor de _isDarkMode
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(onThemeChanged: _toggleTheme),  // Pasa el método para cambiar el tema
        // Agrega más rutas si es necesario
      },
    );
  }
}
