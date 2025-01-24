import 'package:flutter/material.dart';
import 'package:flutter_application_base/helpers/preferences.dart';
import 'package:flutter_application_base/providers/peliculas_populares_provider.dart';
import 'package:flutter_application_base/providers/theme_provider.dart';
import 'package:flutter_application_base/screens/api/peliculas_populares_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/add_movie_form_screen.dart'; // Importa la nueva pantalla

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initShared();
  await dotenv.load(fileName: "env/.env");

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(isDarkMode: Preferences.darkmode),
      ),
      ChangeNotifierProvider(create: (_) => PeliculasPopularesProvider()),
    ],
    child: MyApp(),
  ));
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
    _isDarkMode = Preferences.darkmode;
  }

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
      Preferences.darkmode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(onThemeChanged: _toggleTheme),
        '/add-movie': (context) =>
            AddMovieFormScreen(), // Nueva ruta para agregar películas
        '/peliculas-populares': (context) => PeliculasPopularesScreen(),
      },
    );
  }
}
